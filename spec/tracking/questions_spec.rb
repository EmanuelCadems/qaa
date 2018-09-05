require "rails_helper"

describe Rack::Attack, type: :request do
  let(:tenant) { create(:tenant) }
  let(:tenant_api_key) { tenant.api_key }
  let(:counter) do
    Rack::Attack.cache.store.read("#{tenant.id}:request_counter:/v1/questions")
      .to_i
  end

  before(:each) do
    setup_rack_attack_cache_store
    avoid_test_overlaps_in_cache
  end

  def setup_rack_attack_cache_store
    Rack::Attack.cache.store = Redis.new(host: ENV['REDIS_HOST'],
    port: ENV['REDIS_PORT'], db: ENV['REDIS_DB'],
    password: ENV['REDIS_PASSWORD'])
  end

  def avoid_test_overlaps_in_cache
    Rack::Attack.cache.store.flushall
  end

  context 'valid' do
    it "tracks request" do
      get "/v1/questions", headers: {
        AUTHORIZATION: "Token token=#{tenant_api_key}"
      }

      expect(counter).to eq(1)
    end
  end

  context 'invalid' do
    it "does not track the request" do
      get "/v1/questions", headers: {
        AUTHORIZATION: "Token token=invalid_api_key"
      }

      expect(counter).to be_zero
    end
  end
end
