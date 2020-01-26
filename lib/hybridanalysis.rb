# frozen_string_literal: true

require "hybridanalysis/version"

require "hybridanalysis/clients/client"

require "hybridanalysis/clients/abuse_reports"
require "hybridanalysis/clients/feed"
require "hybridanalysis/clients/file_collection"
require "hybridanalysis/clients/overview"
require "hybridanalysis/clients/quick_scan"
require "hybridanalysis/clients/report"
require "hybridanalysis/clients/search"
require "hybridanalysis/clients/submit"
require "hybridanalysis/clients/system"

require "hybridanalysis/api"

module HybridAnalysis
  class Error < StandardError; end
end
