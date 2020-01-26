# frozen_string_literal: true

RSpec.describe HybridAnalysis::Clients::Overview, :vcr do
  let(:api) { HybridAnalysis::API.new }

  let(:hash) { "275a021bbfb6489e54d471899f7db9d1663fc695ec2fe2a2c4538aabf651fd0f" }

  describe "#get" do
    it do
      res = api.overview.get(hash)
      expect(res).to be_a(Hash)
    end
  end

  describe "#refresh" do
    it do
      res = api.overview.refresh(hash)
      expect(res).to be_an(Array)
    end
  end

  describe "#summary" do
    it do
      res = api.overview.summary(hash)
      expect(res).to be_a(Hash)
    end
  end

  describe "#sample" do
    let(:hash) { "d78931fcf2660108eec0d6674ecb4e02401b5256a6b5ee82527766ef6d198c67" }

    it do
      res = api.overview.sample(hash)
      expect(res).to be_a(String)
    end
  end
end
