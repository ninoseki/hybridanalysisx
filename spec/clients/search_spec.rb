# frozen_string_literal: true

RSpec.describe HybridAnalysis::Clients::Search, :vcr do
  let(:api) { HybridAnalysis::API.new }

  let(:hash) { "275a021bbfb6489e54d471899f7db9d1663fc695ec2fe2a2c4538aabf651fd0f" }

  describe "#hash" do
    it do
      res = api.search.hash(hash)
      expect(res).to be_an(Array)
    end
  end

  describe "#hashes" do
    it do
      res = api.search.hashes(hash)
      expect(res).to be_an(Array)
    end
  end

  describe "#terms" do
    it do
      res = api.search.terms(ssdeep: "3:a+JraNvsgzsVqSwHq9:tJuOgzsko")
      expect(res).to be_a(Hash)
    end
  end
end
