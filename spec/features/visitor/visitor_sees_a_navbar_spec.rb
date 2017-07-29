require 'rails_helper'

RSpec.feature 'Visitors can see a navbar' do
  scenario 'Visitor visits root path' do
    visit landing_page_path

    within '.nav-wrapper' do
      expect(page).to have_link 'Login With Facebook'
      expect(page).to have_link 'Public Folders'
      expect(page).to have_link 'Dark Clout'
    end
  end
end
