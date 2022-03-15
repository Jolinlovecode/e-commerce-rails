require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each) do
    @user_params={
      first_name: 'Jack',
      last_name: 'Ma',
      email: 'alibaba@alibaba.com',
      password: 'alibaba',
      password_confirmation: 'alibaba'
    }
  end 

  describe 'Validations' do
    
    it " should be password" do
      @user_params[:password]=""
      @user = User.create @user_params
      expect(@user).not_to be_valid
      expect(@user.errors.full_messages.first).to eq("Password can't be blank")
    end


    it "password and password_confirmation should match" do
      @user_params[:password_confirmation]="aliba"
      @user = User.create @user_params
      expect(@user).not_to be_valid
      expect(@user.errors.full_messages.first).to eq("Password confirmation doesn't match Password")
    end

    it "email should not be case sensitive" do
      @user_params[:email]="aliBaBa@alibaba.com"
      @user = User.create @user_params
      expect(@user).to be_valid
    end

    it " should have email" do
      @user_params[:email]=""
      @user = User.create @user_params
      expect(@user).not_to be_valid
      expect(@user.errors.full_messages.first).to eq("Email can't be blank")
    end

    it "first_name should have be required " do
      @user_params[ :first_name]=""
      @user = User.create @user_params
      expect(@user).not_to be_valid
      expect(@user.errors.full_messages.first).to eq("First name can't be blank")
    end

    it "last_name should have be required " do
      @user_params[:last_name]=""
      @user = User.create @user_params
      expect(@user).not_to be_valid
      expect(@user.errors.full_messages.first).to eq("Last name can't be blank")
    end

    it "password's length have a minimum length six" do
      @user_params[:password]="aliba"
      @user_params[:password_confirmation]="aliba"
      @user = User.create @user_params
      expect(@user).not_to be_valid
      expect(@user.errors.full_messages.first).to eq ("Password is too short (minimum is 6 characters)")
    end
  end 

  describe '.authenticate_with_credentials' do
    it "should authenticate email and password,login " do
      @user_auth = User.authenticate_with_credentials('alibaba@alibaba.com', 'alibaba')
      expect(@user_auth).equal?(@user)
    end

    it "should not login if password does not match email " do
      @user_auth = User.authenticate_with_credentials('alibaba@alibaba.com', 'aliba')
      expect(@user_auth).equal?nil
    end
  end

  describe 'edge cases' do
    it "should adjust spaces before and/or after email address " do
      @user_auth = User.authenticate_with_credentials(' alibaba@alibaba.com ', 'alibaba')
      expect(@user_auth).equal?(@user)
    end

    it "email should not be case sensitive" do
      @user_auth = User.authenticate_with_credentials('AlibaBa@alibaba.com ', 'alibaba')
      expect(@user_auth).equal?(@user)
    end
  end 
    
end
