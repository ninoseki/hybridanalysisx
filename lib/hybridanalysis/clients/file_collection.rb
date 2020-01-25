# frozen_string_literal: true

module HybridAnalysis
  module Clients
    class FileCollection < Client
      #
      # remove file within collection without hard removal from system
      #
      # @param [String] id File collection id
      # @param [String] hash SHA256 of file to remove
      #
      # @return [Hash]
      #
      def delete(id:, hash: )
        _delete("/file-collection/#{id}/files/#{hash}") { |json| json }
      end

      #
      # return a summary of file collection
      #
      # @param [String] id File collection id
      #
      # @return [Hash]
      #
      def get(id)
        _get("/file-collection/#{id}") { |json| json }
      end

      #
      # return an archive with all collection samples
      #
      # @param [String] id File collection id
      #
      # @return [Hash]
      #
      def download(id)
        _get("/file-collection/#{id}/files/download") { |json| json }
      end

      #
      # search the database using the search terms
      #
      # @param [String, nil] collection_name Collection Name
      # @param [String, nil] tag Hashtag e.g. ransomware
      #
      # @return [Hash]
      #
      def search(collection_name: nil, tag: nil)
        params = { collection_name: collection_name, tag: tag }.compact
        _post("/file-collection/search", params) { |json| json }
      end

      #
      # create file collection
      #
      # @param [String, nil] collection_name Optional collection name
      # @param [String, nil] comment Optional comment text that may be associated with the file collection (Note: you can use #tags here)
      # @param [Boolean, nil] no_share_third_party When set to 'true', samples within collection will never be shared with any third party. Default: true
      # @param [Boolean, nil] allow_community_access When set to 'true', samples within collection will be available for the community. Default: true
      #
      # @return [Hash]
      #
      def create(collection_name: nil, comment: nil, no_share_third_party: nil, allow_community_access: nil)
        params = { collection_name: collection_name, comment: comment, no_share_third_party: no_share_third_party, allow_community_access: allow_community_access }.compact
        _post("/file-collection/create", params) { |json| json }
      end

      #
      # add file to collection
      #
      # @param [String] id File collection id
      # @param [String] file File to add
      #
      # @return [Hash]
      #
      def add(id:, file: )
        params = { file: file }.compact
        _post("/file-collection/#{id}/files/add", params) { |json| json }
      end
    end

    class Key < Client
      #
      # return information about the used API key and it limits
      #
      # @return [Hash]
      #
      def current
        _get("/key/current") { |json| json }
      end
    end
  end
end
