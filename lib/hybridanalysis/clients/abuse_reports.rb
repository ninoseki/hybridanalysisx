# frozen_string_literal: true

module HybridAnalysis
  module Clients
    class AbuseReports < Client
      #
      # Allows to request removal
      #
      # @param [String] sha256 SHA256 of the sample you want to report
      # @param [String] reason Report reason
      #
      # @return [Hash]
      #
      def new(sha256:, reason: )
        params = {
          sha256: sha256,
          reason: reason
        }.compact
        _post("/abuse-reports/new", params) { |json| json }
      end
    end
  end
end
