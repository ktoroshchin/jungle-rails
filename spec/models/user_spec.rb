require 'rails_helper'
RSpec.describe User, type: :model do
  describe 'Validations' do
    it 'should be true if password and password_confirmation match ' do
      @user = User.new(password: "Password", password_confirmation: "Password")
      @user.password.should eq(@user.password_confirmation)
    end
    it 'email must be unique' do
      @user = User.new(email: "test@test.com", password: "password", name:"User")
      @user.save

      @user2 = User.new(email: "tEst@test.com", password: "password", name:"User")
      @user2.save
      puts @user2.errors.get(:email)
      expect(@user2.errors.get(:email)).to eq(["has already been taken"])
    end
    it 'name must be provided' do
      @user = User.new(name: "Google")
      expect(@user.name).to be_present
    end
    it 'password length at least 6 characters' do
      @user = User.new(password: "fgyh", name:"Hello")
      @user.should_not be_valid
      @user.password = '123456789'
      @user.should be_valid
    end
  end
  describe '.authenticate_with_credentials' do
    it 'should return user' do
      @user25 = User.new({email: "newuser@test.com", password: "humbl123e123", name: "Char"})
      @user25.save
      @user_verified = User.authenticate_with_credentials(@user25.email, @user25.password)
      expect(@user_verified).to eql(@user25)
    end
  end
end