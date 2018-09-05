require 'rails_helper'

describe 'rake redis:persist', type: :task do
  let(:tenant) { create(:tenant) }
  let(:amount_requests) { '300' }


  before do
    setup_rack_attack_cache_store
    avoid_test_overlaps_in_cache
    Rack::Attack.cache.store
      .set("#{tenant.id}:request_counter:/v1/questions", amount_requests)
  end

  def setup_rack_attack_cache_store
    Rack::Attack.cache.store = Redis.new(host: ENV['REDIS_HOST'],
    port: ENV['REDIS_PORT'], db: ENV['REDIS_DB'],
    password: ENV['REDIS_PASSWORD'])
  end

  def avoid_test_overlaps_in_cache
    Rails.cache.clear
  end

  it 'preloads the Rails environment' do
    expect(task.prerequisites).to include 'environment'
  end

  it 'persist requests count in db' do
    task.execute
    expect(tenant.reload.count_requests_backup).to eq(amount_requests)
  end
end
