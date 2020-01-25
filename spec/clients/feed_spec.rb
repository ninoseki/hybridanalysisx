# frozen_string_literal: true

RSpec.describe HybridAnalysis::Clients::Feed, :vcr do
  let(:api) { HybridAnalysis::API.new }

  describe "#latest" do
    it do
      res = api.feed.latest
      expect(res).to be_a(Hash)
    end
  end
end
