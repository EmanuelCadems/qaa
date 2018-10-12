class Tenant < ApplicationRecord
  include TenantAdmin

  validates :name, presence: true, uniqueness: true

  # Assign an API key on create
  before_create do |tenant|
    tenant.api_key = ApiKeyGenerator.exec
  end

  def count_requests
    Rack::Attack.cache.store.read("#{id}:request_counter:/v1/questions").to_i
  end
end
