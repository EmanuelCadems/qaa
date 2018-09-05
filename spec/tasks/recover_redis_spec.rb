require 'rails_helper'

describe 'rake redis:recover', type: :task do
  let(:amount_requests) { '300' }
  let(:tenant) { create(:tenant, count_requests_backup: amount_requests) }

  before do
    tenant
    setup_rack_attack_cache_store
    avoid_test_overlaps_in_cache
    allow(STDIN).to receive(:gets).and_return('y')
    allow(STDOUT).to receive(:puts)
    allow(ProgressBar).to receive(:create).and_return(double('ProgressBar'))
    allow(ProgressBar.create).to receive(:increment)
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

  it 'recover count_requests_backup from DB to Redis' do
    task.execute
    expect(
      Rack::Attack.cache.store
        .read("#{tenant.id}:request_counter:/v1/questions")
    ).to eq(amount_requests)
  end
end
