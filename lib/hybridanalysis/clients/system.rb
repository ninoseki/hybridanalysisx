# frozen_string_literal: true

module HybridAnalysis
  module Clients
    class System < Client
      #
      # return system elements versions
      #
      # @return [Hash]
      #
      def version
        _get("/system/version") { |json| json }
      end

      #
      # return information about available execution environments
      #
      # @return [Array]
      #
      def environments
        _get("/system/environments") { |json| json }
      end

      #
      # contains a variety of webservice statistics, e.g. the total number of submissions, unique submissions, signature ID distribution, user comments, etc.
      #
      # @return [Hash]
      #
      def stats
        _get("/system/stats") { |json| json }
      end

      #
      # a partial information about instance configuration
      #
      # @return [Hash]
      #
      def configuration
        _get("/system/configuration") { |json| json }
      end

      #
      # return information about queue size
      #
      # @return [Hash]
      #
      def queue_size
        _get("/system/queue-size") { |json| json }
      end

      #
      # return total number of submission
      #
      # @return [Hash]
      #
      def total_submissions
        _get("/system/total-submissions") { |json| json }
      end
    end
  end
end
