# frozen_string_literal: true

module HybridAnalysis
  module Clients
    class Overview < Client
      #
      # return overview for hash
      #
      # @param [String] sha256 SHA256 for lookup
      #
      # @return [Hash]
      #
      def get(sha256)
        _get("/overview/#{sha256}") { |json| json }
      end

      #
      # refresh overview and download fresh data from external services
      #
      # @param [String] sha256 SHA256 for lookup
      #
      # @return [Hash]
      #
      def refresh(sha256)
        _get("/overview/#{sha256}/refresh") { |json| json }
      end

      #
      # return overview for hash
      #
      # @param [String] sha256 SHA256 for lookup
      #
      # @return [Hash]
      #
      def summary(sha256)
        _get("/overview/#{sha256}/summary") { |json| json }
      end

      #
      # downloading sample file
      #
      # @param [String] sha256 SHA256 for download
      #
      # @return [Hash]
      #
      def sample(sha256)
        _get("/overview/#{sha256}/sample") { |json| json }
      end
    end
  end
end
