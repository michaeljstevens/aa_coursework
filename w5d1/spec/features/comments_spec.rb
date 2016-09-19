require 'spec_helper'
require 'rails_helper'


feature "the comment process" do

  context "with valid params" do

    scenario "can comment on a user" do
      sign_in_user_1
      save_and_open_page
      visit "/users/2"
      fill_in 'Add Comment', with: "new comment blahblahblah"
      click_on "Submit Comment"
      expect(page).to have_content "new comment blahblahblah"
    end

    scenario "can comment on a gaol" do

    end

    scenario "requires logged in" do

    end
  end

  context "with invalid params" do

    scenario "cannot comment on a user" do

    end

    scenario "cannot comment on a goal" do

    end

  end





end
