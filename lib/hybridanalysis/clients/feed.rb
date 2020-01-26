# frozen_string_literal: true

module HybridAnalysis
  module Clients
    class Feed < Client
      #
      # access a JSON feed (summary information) of last 250 reports from 24h
      #
      # @return [Hash]
      #
      def latest
        _get("/feed/latest") { |json| json }
      end
    end
  end
end
