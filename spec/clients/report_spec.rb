# frozen_string_literal: true

RSpec.describe HybridAnalysis::Clients::Report, :vcr do
  let(:api) { HybridAnalysis::API.new }

  let(:id) { "6f802a566778618b6a97db31e06f05deb18abd75871a6b972733e6a52c41c90c:120" }

  describe "#state" do
    it do
      res = api.report.state(id)
      expect(res).to be_a(Hash)
    end
  end

  describe "#summary" do
    it do
      res = api.report.summary(id)
      expect(res).to be_a(Hash)
    end
  end

  describe "#summaries" do
    it do
      res = api.report.summaries(id)
      expect(res).to be_an(Array)
    end
  end
end
