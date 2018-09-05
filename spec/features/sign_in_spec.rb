# encoding: UTF-8
require 'rails_helper'

describe "the signin process", type: :feature do
  context 'valid' do
    it "signs me in" do
      basic_auth!
      visit '/admin'

      expect(page).to have_http_status(200)
    end
  end

  context 'invalid' do
    it 'resturns unauthorized' do
      visit '/admin'

      expect(page).to have_http_status(401)
    end
  end
end
