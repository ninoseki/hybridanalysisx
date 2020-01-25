# frozen_string_literal: true

module HybridAnalysis
  module Clients
    class Report < Client
      #
      # downloading certificate file from report (is available)
      #
      # @param [String] id Id in one of format: 'jobId' or 'sha256:environmentId'
      #
      # @return [Hash]
      #
      def certificate(id)
        _get("/report/#{id}/certificate") { |json| json }
      end

      #
      # downloading process memory dump files as zip file (is available)
      #
      # @param [String] id Id in one of format: 'jobId' or 'sha256:environmentId'
      #
      # @return [Hash]
      #
      def memory_dumps(id)
        _get("/report/#{id}/memory-dumps") { |json| json }
      end

      #
      # downloading network PCAP file from report (is available)
      #
      # @param [String] id Id in one of format: 'jobId' or 'sha256:environmentId'
      #
      # @return [Hash]
      #
      def pcap(id)
        _get("/report/#{id}/pcap") { |json| json }
      end

      #
      # downloading sample file
      #
      # @param [String] id Id in one of format: 'jobId' or 'sha256:environmentId'
      #
      # @return [Hash]
      #
      def sample(id)
        _get("/report/#{id}/sample") { |json| json }
      end

      #
      # return state of a submission
      #
      # @param [String] id Id in one of format: 'jobId' or 'sha256:environmentId'
      #
      # @return [Hash]
      #
      def state(id)
        _get("/report/#{id}/state") { |json| json }
      end

      #
      # return summary of a submission
      #
      # @param [String] id Id in one of format: 'jobId' or 'sha256:environmentId'
      #
      # @return [Hash]
      #
      def summary(id)
        _get("/report/#{id}/summary") { |json| json }
      end

      #
      # return summary of multiple submissions (bulk query)
      #
      # @param [Array<String>] hashes[] List of ids. Allowed format: jobId, md5:environmentId, sha1:environmentId or sha256:environmentId
      #
      # @return [Array]
      #
      def summaries(*hashes)
        params = { "hashes[]": hashes }.compact
        _post("/report/summary", params) { |json| json }
      end

      #
      # downloading report data (e.g. JSON, XML, PCAP)
      #
      # @param [String] id Id in one of format: 'jobId' or 'sha256:environmentId'
      # @param [String] type Type of requested report,
      #
      # @return [Hash]
      #
      def get(id:, type: )
        _get("/report/#{id}/report/#{type}") { |json| json }
      end

      #
      # retrieve an array of screenshots from a report in the Base64 format
      #
      # @param [String] id Id in one of format: 'jobId' or 'sha256:environmentId'
      #
      # @return [Hash]
      #
      def screenshots(id)
        _get("/report/#{id}/screenshots") { |json| json }
      end

      #
      # retrieve single extracted/dropped binaries files for a report
      #
      # @param [String] id Id in one of format: 'jobId' or 'sha256:environmentId'
      # @param [String] hash SHA256 of dropped file
      #
      # @return [Hash]
      #
      def dropped_file_raw(id:, hash: )
        _get("/report/#{id}/dropped-file-raw/#{hash}") { |json| json }
      end

      #
      # retrieve all extracted/dropped binaries files for a report, as zip
      #
      # @param [String] id Id in one of format: 'jobId' or 'sha256:environmentId'
      #
      # @return [Hash]
      #
      def dropped_files(id)
        _get("/report/#{id}/dropped-files") { |json| json }
      end
    end
  end
end
