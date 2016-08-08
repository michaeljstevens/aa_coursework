# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  username        :text             not null
#  password_digest :text             not null
#  session_token   :text             not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'rails_helper'

RSpec.describe User, type: :model do
  it { should validate_presence_of(:username) }
  it { should validate_presence_of(:password_digest) }
  it { should validate_presence_of(:session_token) }
  it { should validate_length_of(:password).is_at_least(6) }
  it { should have_many(:goals) }

  describe "User::find_by_credentials" do

    it "should find by username" do
      user = User.create!(username: "user1", password: "password")
      check_user = User.find_by_credentials("user1", "password")
      expect(user).to eq(check_user)
    end

    it "should return nil if user not found" do
      user = User.create!(username: "user1", password: "password")
      check_user = User.find_by_credentials("user1", "passwordasdf")
      expect(check_user).to eq(nil)
    end
  end

  describe "#is_password?" do
    it "should return true if passwords match" do
      user = User.create!(username: "user1", password: "password")
      expect(user.is_password?("password")).to eq(true)
    end

    it "should return false if passwonds don't match" do
      user = User.create!(username: "user1", password: "password")
      expect(user.is_password?("passwdfasdford")).to eq(false)
    end
  end

  describe "password" do
    it "should not save as a variable after being created" do
      user = User.create!(username: "user1", password: "password")
      expect(User.last.password).to be(nil)
    end
  end
end
