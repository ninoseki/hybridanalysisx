# frozen_string_literal: true

RSpec.describe HybridAnalysis::Clients::Submit, :vcr do
  let(:api) { HybridAnalysis::API.new }

  describe "#submit" do
    it do
      path = File.expand_path("../fixtures/test.txt", __dir__)
      res = api.submit.file(file: path, environment_id: 110)
      expect(res).to be_a(Hash)
    end
  end
end
