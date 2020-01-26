# frozen_string_literal: true

RSpec.describe HybridAnalysis::Clients::System, :vcr do
  let(:api) { HybridAnalysis::API.new }

  describe "#version" do
    it do
      res = api.system.version
      expect(res).to be_a(Hash)
    end
  end

  describe "#environments" do
    it do
      res = api.system.environments
      expect(res).to be_an(Array)
    end
  end

  describe "#stats" do
    it do
      res = api.system.stats
      expect(res).to be_a(Hash)
    end
  end

  describe "#configuration" do
    it do
      res = api.system.configuration
      expect(res).to be_a(Hash)
    end
  end

  describe "#queue_size" do
    it do
      res = api.system.queue_size
      expect(res).to be_a(Hash)
    end
  end

  describe "#total_submissions" do
    it do
      res = api.system.total_submissions
      expect(res).to be_a(Hash)
    end
  end
end
