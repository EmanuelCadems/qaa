require 'rails_helper'

RSpec.describe Answer, type: :model do
  it { should validate_presence_of(:name) }
  it { should belong_to(:question) }
  it { should belong_to(:provider).class_name('User') }
  it { should have_db_column(:name).of_type(:string) }
end
