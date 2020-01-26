# frozen_string_literal: true

RSpec.describe HybridAnalysis::Clients::QuickScan, :vcr do
  let(:api) { HybridAnalysis::API.new }

  describe "#state" do
    it do
      res = api.quick_scan.state
      expect(res).to be_an(Array)
    end
  end

  describe "#file" do
    it do
      path = File.expand_path("../fixtures/test.txt", __dir__)
      res = api.quick_scan.file(file: path, scan_type: "all")
      expect(res).to be_a(Hash)
    end
  end
end
