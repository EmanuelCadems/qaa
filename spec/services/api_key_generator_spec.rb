require 'rails_helper'

RSpec.describe ApiKeyGenerator, '.exec' do

  it 'generates a unique API KEY' do
    expect(ApiKeyGenerator.exec).to be_truthy
  end

  it 'does not generate an API KEY already assigned to a Tenant' do
    expect(Tenant.exists?(api_key: ApiKeyGenerator.exec)).to be_falsey
  end
end
