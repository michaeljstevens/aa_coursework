require 'spec_helper'
require 'rails_helper'

feature "CRUD" do

  before(:each) do
    User.create!(username: "user1", password: "password")
    visit new_session_url
    fill_in 'username', with: "user1"
    fill_in 'password', with: "password"
    click_on "Sign In User"
  end

  feature "#new" do
    scenario "it renders new page" do
      visit new_goal_url
      expect(page).to have_content("New Goal")
    end
  end

  feature "#create" do

    context "with valid params" do
      scenario "should create a new goal" do
        visit new_goal_url
        fill_in 'Title', with: "goal1"
        fill_in 'Details', with: "description1"
        click_on "Create Goal"
        expect(page).to have_content("goal1")
      end
    end


    context "with invalid params" do
      scenario "should throw an error" do
        visit new_goal_url
        click_on "Create Goal"
        expect(page).to have_content "Title can't be blank"
      end
    end


  end

  feature "#edit" do

    context "with valid params" do

      scenario "should be able to edit own goal" do
        User.create!(username: "user1", password: "password")
        visit new_goal_url
        fill_in 'Title', with: "goal1"
        fill_in 'Details', with: "description1"
        click_on 'Create Goal'
        click_on 'Edit Goal'
        fill_in  'Title', with: 'new title'
        click_on 'Update Goal'
        expect(page).to have_content "new title"
      end

      scenario "should not be able to edit someone else's goal" do
        sign_in_user_1
        create_goal_user_1
        sign_in_user_2

        visit edit_goal_url(Goal.last)
        fill_in  'Title', with: 'new title'
        click_on 'Update Goal'
        expect(page).to have_content "that's not your goal!"
      end

    end

  end

  feature "#show" do

    scenario "should be able to see someone else's public goals" do
      sign_in_user_1
      create_goal_user_1
      sign_in_user_2

      visit goal_url(Goal.last)
      expect(page).to have_content("goal1")
    end

    scenario "should not be able to see someone else's private goals" do

      sign_in_user_1
      create_private_goal_user_1
      sign_in_user_2

      visit goal_url(Goal.last)
      expect(page).to have_content("This goal is private")
    end

    scenario "should be able to see your own private goals" do
      sign_in_user_1
      create_private_goal_user_1

      visit goal_url(Goal.last)
      expect(page).to have_content("goal1")
    end

    scenario "should be able to see if goal is completed" do
      sign_in_user_1
      create_goal_user_1
      visit goal_url(Goal.last)
      expect(page).to have_content("completed")
    end

  end
end
