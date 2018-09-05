class Tenant < ApplicationRecord
  include TenantAdmin

  validates :name, presence: true, uniqueness: true

  # Assign an API key on create
  before_create do |tenant|
    tenant.api_key = tenant.generate_api_key
  end

  # Generate a unique API key
  def generate_api_key
    loop do
      token = SecureRandom.base64.tr('+/=', 'Qrt')
      break token unless Tenant.exists?(api_key: token)
    end
  end

  def count_requests
    Rack::Attack.cache.store.read("#{id}:request_counter:/v1/questions").to_i
  end
end
