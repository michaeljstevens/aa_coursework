require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe "GET #new" do
    it "renders the new user template" do

      get :new, user: {}

      expect(response).to render_template("new")
      expect(response).to have_http_status(200)
    end
  end

  describe "POST #create" do

    context "with valid params" do
      it "should log in user and direct to goal index" do
        post :create, user: {username: "user1", password: "password"}
        expect(response).to redirect_to(user_url(User.last))
      end
    end

    context "with invalid params" do
      it "should throw an error with invalid params" do
        post :create, user: {username: "user1", password: "pass"}
        expect(response).to render_template("new")
        expect(flash[:errors]).to be_present
      end
    end
  end


end
