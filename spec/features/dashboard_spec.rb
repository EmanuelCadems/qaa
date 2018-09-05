# encoding: UTF-8
require 'rails_helper'

describe "dashboard", type: :feature do
  before do
    create_list(:tenant, 4)
    create_list(:answer, 5)
  end
  it 'shows the total number of Users, Questions, and Answers, and Tenants' do
    basic_auth!
    visit '/admin'

    expect(page).to have_content("Users")
    expect(page).to have_content(User.count)

    expect(page).to have_content("Questions")
    expect(page).to have_content(Question.count)

    expect(page).to have_content("Answers")
    expect(page).to have_content(Answer.count)

    expect(page).to have_content("Tenant")
    expect(page).to have_content(Tenant.count)
  end
end
