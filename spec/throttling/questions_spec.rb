require "rails_helper"

describe Rack::Attack, type: :request do
  let(:tenant) { create(:tenant) }
  let(:first_limit) { ENV['FIRST_LIMIT'].to_i }
  let(:tenant_api_key) { tenant.api_key }
  let(:first_period) { ENV['FIRST_PERIOD'].to_i.seconds }
  let(:second_period) { ENV['SECOND_PERIOD'].to_i.seconds }

  before(:each) do
    setup_rack_attack_cache_store
    avoid_test_overlaps_in_cache
    create_list(:question, 3)
  end

  def setup_rack_attack_cache_store
    Rack::Attack.cache.store = Redis.new(host: ENV['REDIS_HOST'],
    port: ENV['REDIS_PORT'], db: ENV['REDIS_DB'],
    password: ENV['REDIS_PASSWORD'])
  end

  def avoid_test_overlaps_in_cache
    Rails.cache.clear
  end

  context 'requests < first_limit' do
    it "returns success" do
      (first_limit - 1).times do
        Rack::Attack
        .cache
        .count("questions/tenant:Token token=#{tenant_api_key}", first_period)
      end

      get "/v1/questions", headers: {
        AUTHORIZATION: "Token token=#{tenant_api_key}"
      }

      expect(response).to have_http_status(:success)
    end
  end

  context 'requests > first_limit' do
    it "throttle excessive questions by tenant" do
      (first_limit).times do
        Rack::Attack
        .cache
        .count("questions/tenant:Token token=#{tenant_api_key}", first_period)
      end

      get "/v1/questions", headers: {
        AUTHORIZATION: "Token token=#{tenant_api_key}"
      }

      expect(response).to have_http_status(:too_many_requests)
    end
  end
end
