require 'rails_helper'

RSpec.feature "As a visitor", :type => :feature do
  scenario "when I click on the Grab Bag button in the navbar" do
    visit landing_page_path

    within '.nav-wrapper' do
      click_on 'Dark Clout'
    end
    expect(current_path).to eq(landing_page_path)
  end
end
