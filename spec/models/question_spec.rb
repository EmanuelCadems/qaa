require 'rails_helper'

RSpec.describe Question, type: :model do
  it { should validate_presence_of(:name) }
  it { should have_many(:answers) }
  it { should belong_to(:asker).class_name('User') }
  it { should have_db_column(:private).of_type(:boolean) }
  it { should have_db_column(:name).of_type(:string) }
end
