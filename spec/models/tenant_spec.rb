require 'rails_helper'

RSpec.describe Tenant, type: :model do
  it { should validate_presence_of(:name) }
  it { should validate_uniqueness_of(:name) }
  it { should have_db_column(:name).of_type(:string) }
  it { should have_db_column(:api_key).of_type(:string) }

  describe '#before_create' do
    subject { build(:tenant) }

    it 'set api_key' do
      subject.save
      expect(subject.api_key).to be_truthy
    end
  end
end
