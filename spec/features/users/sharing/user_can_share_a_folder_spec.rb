require 'rails_helper'

RSpec.feature 'User can share folders' do
  context 'User is logged in' do
    scenario 'User views folders shared with him' do
      user = create :user
      other_user = create :user
      user.folders_shared_with << other_user.home

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit user.home.url

      click_on 'Folders Shared with Me'

      expect(current_path).to eq users_shared_folders_path(user.username)

      within 'tr:first' do
        expect(page).to have_link other_user.home.name
        expect(page).to have_content other_user.username
      end
    end

    scenario 'User visits child folder in a folder shared with him' do
      user = create :user
      other_user = create :user_with_folders
      binary1 = other_user.home.binaries.first
      folder = other_user.home.folders.first
      binary2 = create :binary, folder: folder

      user.folders_shared_with << other_user.home

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit users_shared_folders_path(user.username)

      click_on other_user.home.name

      expect(current_path).to eq other_user.home.url
      expect(page).to have_link binary1.name

      click_on folder.name

      expect(current_path).to eq folder.url
      expect(page).to have_link binary2.name
    end

    scenario 'User cannot view a shared folders parent' do
      user = create :user
      other_user = create :user_with_folders
      folder = other_user.home.folders.first
      binary = create :binary, folder: folder

      user.folders_shared_with << folder

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit users_shared_folders_path(user.username)

      expect(page).to_not have_link 'Home'
      expect(page).to have_link folder.name

      click_on folder.name

      expect(page).to have_link binary.name

      visit other_user.home.url

      expect(page.status_code).to eq 404
    end
  end
end
