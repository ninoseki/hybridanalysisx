# frozen_string_literal: true

module HybridAnalysis
  class API
    def initialize(key: ENV["HYBRIDANALYSIS_API_KEY"] || ENV["HA_API_KEY"])
      @key = key
    end

    def abuse_reports
      @abuse_reports ||= Clients::AbuseReports.new(@key)
    end

    def feed
      @feed ||= Clients::Feed.new(@key)
    end

    def file_collection
      @file_collection ||= Clients::FileCollection.new(@key)
    end

    def overview
      @overview ||= Clients::Overview.new(@key)
    end

    def quick_scan
      @quick_scan ||= Clients::QuickScan.new(@key)
    end

    def report
      @report ||= Clients::Report.new(@key)
    end

    def search
      @search ||= Clients::Search.new(@key)
    end

    def submit
      @submit ||= Clients::Submit.new(@key)
    end

    def system
      @system ||= Clients::System.new(@key)
    end
  end
end
