require 'rails_helper'

RSpec.describe Tenant, type: :model do
  it { should validate_presence_of(:name) }
  it { should have_db_column(:name).of_type(:string) }
  it { should have_db_column(:api_key).of_type(:string) }
end
