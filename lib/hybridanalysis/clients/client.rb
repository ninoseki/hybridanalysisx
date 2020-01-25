# frozen_string_literal: true

require "net/https"
require "json"
require "uri"
require "zlib"

module HybridAnalysis
  module Clients
    class Client
      attr_reader :key

      HOST = "www.hybrid-analysis.com"
      VERSION = "v2"
      BASE_URL = "https://#{HOST}/api/#{VERSION}"
      DEFAULT_UA = "Falcon Sandbox"

      def initialize(key)
        @key = key
      end

      private

      def url_for(path)
        URI(BASE_URL + path)
      end

      def https_options
        if proxy = ENV["HTTPS_PROXY"] || ENV["https_proxy"]
          uri = URI(proxy)
          {
            proxy_address: uri.hostname,
            proxy_port: uri.port,
            proxy_from_env: false,
            use_ssl: true
          }
        else
          { use_ssl: true }
        end
      end

      def request(req)
        Net::HTTP.start(HOST, 443, https_options) do |http|
          req["api-key"] = key
          req["user-agent"] = DEFAULT_UA

          response = http.request(req)

          code = response.code.to_i
          body = response.body
          json = JSON.parse(body) if response["Content-Type"].to_s.include?("application/json")
          body = unzip(body) if response["Content-Type"].to_s.include?("application/gzip")

          case code
          when 200, 201, 202
            if json
              yield json
            else
              yield body
            end
          else
            message = json&.dig("message") || body
            raise Error, "Unsupported response code returned: #{code} (#{message})"
          end
        end
      end

      def _get(path, params = {}, &block)
        uri = url_for(path)
        uri.query = URI.encode_www_form(params)
        get = Net::HTTP::Get.new(uri)

        request(get, &block)
      end

      def _post(path, params = {}, &block)
        post = Net::HTTP::Post.new(url_for(path))
        post.set_form params

        request(post, &block)
      end

      def _post_with_file(path, file:, filename:, params: {}, &block)
        post = Net::HTTP::Post.new(url_for(path))
        data = [
          ["file", file, { filename: filename }],
        ]
        data += stringfy_keys(params)
        post.set_form(data, "multipart/form-data")

        request(post, &block)
      end

      def _delete(path, params = {}, &block)
        delete = Net::HTTP::Delete.new(url_for(path))
        delete.body = JSON.generate(params) if params

        request(delete, &block)
      end

      def stringfy_keys(hash)
        hash.map do |k, v|
          [k.to_s, v]
        end
      end

      def path?(path)
        File.exist? path
      end

      def unzip(data)
        sio = StringIO.new(data)
        gz = Zlib::GzipReader.new(sio)
        gz.read
      end
    end
  end
end
