require 'spec_helper'
require 'rails_helper'

feature "the signup process" do

  scenario "has a new user page" do
    visit new_user_url
    expect(page).to have_content "New User"
  end

  feature "signing up a user" do

    before(:each) do
      visit new_user_url
      fill_in 'username', with: "user1"
      fill_in 'password', with: "password"
      click_on "Create User"
    end

    scenario "shows username on the homepage after signup" do
      expect(page).to have_content "user1"
    end

  end
end

feature "logging in" do

  before(:each) do
    User.create!(username: "user1", password: "password")
    visit new_session_url
    fill_in 'username', with: "user1"
    fill_in 'password', with: "password"
    click_on "Sign In User"
  end
  scenario "shows username on the homepage after login" do
    expect(page).to have_content "user1"
  end

end

feature "logging out" do

  scenario "begins with a logged out state" do
    visit users_url
    expect(page).not_to have_content "user1"
  end

  scenario "doesn't show username on the homepage after logout" do
    User.create!(username: "user1", password: "password")
    visit new_session_url
    fill_in 'username', with: "user1"
    fill_in 'password', with: "password"
    click_on "Sign In User"
    click_on "Sign Out"

    expect(page).not_to have_content "user1"
  end

end
