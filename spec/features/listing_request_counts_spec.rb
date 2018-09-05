# encoding: UTF-8
require 'rails_helper'

describe "Tenant API request counts", type: :feature do
  before do
    create_list(:tenant, 4)
  end
  it 'shows the Tenant API request counts' do
    basic_auth!
    visit '/admin/tenant'

    expect(page).to have_content("List of Tenants")

    Tenant.all.each do |tenant|
      expect(page).to have_content tenant.name
      expect(page).to have_content tenant.count_requests
    end
  end
end
