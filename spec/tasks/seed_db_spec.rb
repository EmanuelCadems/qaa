require 'rails_helper'

describe 'rake db:seed', type: :task do
  it 'populates db' do
    task.execute
    expect(Question.count).to eq(ENV['QUESTIONS_COUNT'].to_i)
    expect(User.count).to be >= ENV['QUESTIONS_COUNT'].to_i
    expect(Answer.count).to be >= ENV['QUESTIONS_COUNT'].to_i
    expect(Tenant.count).to be >= ENV['TENANTS_COUNT'].to_i
  end
end
