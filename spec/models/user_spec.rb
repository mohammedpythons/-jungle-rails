require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    # validation tests/examples here
    it "password should match password coformation" do
      @user = User.create(first_name: "moe", last_name: "shokai", email: "n@gmail.com", password: "1234", password_confirmation: "1234")
      expect(@user).to be_valid
    end

    it "password should not match password coformation" do
      @user = User.create(first_name: "moe", last_name: "shokai", email: "n@gmail.com", password: "1234", password_confirmation: "12423")
      expect(@user).to_not be_valid
    end
    it "email is not case sensitive" do
      @user = User.create(first_name: "moe", last_name: "shokai", email: "n@gmail.com", password: "1234", password_confirmation: "1234")
      @user2 = User.create(first_name: "moe", last_name: "shokai", email: "N@gmail.com", password: "1234", password_confirmation: "1234")
      expect(@user).to be_valid
      expect(@user2).to_not be_valid
    end

    it "The password must have a minimum length of 4" do
      @user = User.create(first_name: "moe", last_name: "shokai", email: "n@gmail.com", password: "1234", password_confirmation: "1234")
      expect(@user).to be_valid
    end

    it "The password must not be less than 4" do
      @user = User.create(first_name: "moe", last_name: "shokai", email: "n@gmail.com", password: "12", password_confirmation: "1234")
      expect(@user).to_not be_valid
    end



  end

  describe '.authenticate_with_credentials' do
    # examples for this class method here
    it "it should return user" do
      @user = User.create(first_name: "moe", last_name: "shokai", email: "n@gmail.com", password: "1234", password_confirmation: "1234")
      @user2  = User.authenticate_with_credentials("n@gmail.com", "1234")
      expect(@user).to eq @user2
    end

    it "it should return nil when password is incorrect" do
      @user = User.create(first_name: "moe", last_name: "shokai", email: "n@gmail.com", password: "1234", password_confirmation: "1234")
      @user2  = User.authenticate_with_credentials("n@gmail.com", "1234343434")
      expect(@user2).to eq nil
    end

    it "it should return nil when email is incorrect" do
      @user = User.create(first_name: "moe", last_name: "shokai", email: "n@gmail.com", password: "1234", password_confirmation: "1234")
      @user2  = User.authenticate_with_credentials("nnnn@gmail.com", "1234343434")
      expect(@user2).to eq nil
    end

    it "it passes when an email has spaces" do
      @user = User.create(first_name: "moe", last_name: "shokai", email: "n@gmail.com", password: "1234", password_confirmation: "1234")
      @user2  = User.authenticate_with_credentials(" n@gmail.com ", "1234")
      expect(@user).to eq(@user2)
    end

    it "it passes when an email has capital letters" do
      @user = User.create(first_name: "moe", last_name: "shokai", email: "n@gmail.com", password: "1234", password_confirmation: "1234")
      @user2  = User.authenticate_with_credentials(" N@gmail.com ", "1234")
      expect(@user).to eq(@user2)
    end

  end
end
