require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it "user with valid input will save" do
      @user = User.new
      @user.first_name = "fname"
      @user.last_name = "lname"
      @user.email = "example@domain.com"
      @user.password = "password"
      @user.password_confirmation = "password"
      @user.save!
      expect(@user.first_name).to be_present
      expect(@user.last_name).to be_present
      expect(@user.email).to be_present
      expect(@user.password).to be_present
      expect(@user.password_confirmation).to be_present
    end
    it "is not valid if password and password_confirmation do not match" do
      @user = User.new
      @user.first_name = "fname"
      @user.last_name = "lname"
      @user.email = "example@domain.com"
      @user.password = "password"
      @user.password_confirmation = "notpassword"
      expect(@user).to_not be_valid
    end
    it "is valid if password and password_confirmation match" do
      @user = User.new
      @user.first_name = "fname"
      @user.last_name = "lname"
      @user.email = "example@domain.com"
      @user.password = "password"
      @user.password_confirmation = "password"
      expect(@user).to be_valid
    end
    it "is not valid if email is not unique" do
      @user = User.new
      @user.first_name = "fname"
      @user.last_name = "lname"
      @user.email = "example@domain.com"
      @user.password = "password"
      @user.password_confirmation = "password"
      @user.save!
      @user = User.new
      @user.first_name = "fname"
      @user.last_name = "lname"
      @user.email = "example@domain.com"
      @user.password = "password"
      @user.password_confirmation = "password"
      expect(@user).to_not be_valid
    end
    it "is not valid if any first_name empty" do
      @user = User.new
      @user.first_name = ""
      @user.last_name = "lname"
      @user.email = "example@domain.com"
      @user.password = "password"
      @user.password_confirmation = "password"
      expect(@user).to_not be_valid
    end
    it "is not valid if any last_name empty" do
      @user = User.new
      @user.first_name = "fname"
      @user.last_name = ""
      @user.email = "example@domain.com"
      @user.password = "password"
      @user.password_confirmation = "password"
      expect(@user).to_not be_valid
    end
    it "is not valid if any email empty" do
      @user = User.new
      @user.first_name = "fname"
      @user.last_name = "lname"
      @user.email = ""
      @user.password = "password"
      @user.password_confirmation = "password"
      expect(@user).to_not be_valid
    end
    it "is not valid if any password_confirmation empty" do
      @user = User.new
      @user.first_name = "fname"
      @user.last_name = "lname"
      @user.email = "example@domain.com"
      @user.password = "password"
      @user.password_confirmation = ""
      expect(@user).to_not be_valid
    end
    it "is not valid if password less that 6 characters" do
      @user = User.new
      @user.first_name = "fname"
      @user.last_name = "lname"
      @user.email = "example@domain.com"
      @user.password = "pswrd"
      @user.password_confirmation = "pswrd"
      expect(@user).to_not be_valid
    end
  end

  describe '.authenticate_with_credentials' do
    it "authenticate_with_credentials returns correct user info" do
      @user = User.new
      @user.first_name = "fname"
      @user.last_name = "lname"
      @user.email = "example@domain.com"
      @user.password = "password"
      @user.password_confirmation = "password"
      @user.save!
      expect(User.authenticate_with_credentials(@user.email, @user.password)).to eq(@user)
    end
    it "authenticate_with_credentials returns correct user info if spaces before/after email" do
      @user = User.new
      @user.first_name = "fname"
      @user.last_name = "lname"
      @user.email = "example@domain.com"
      @user.password = "password"
      @user.password_confirmation = "password"
      @user.save!
      expect(User.authenticate_with_credentials(" example@domain.com ", @user.password)).to eq(@user)
    end
    it "authenticate_with_credentials returns correct user info if spaces before/after email" do
      @user = User.new
      @user.first_name = "fname"
      @user.last_name = "lname"
      @user.email = "eXample@domain.COM"
      @user.password = "password"
      @user.password_confirmation = "password"
      @user.save!
      expect(User.authenticate_with_credentials("EXAMPLe@DOMAIN.CoM", @user.password)).to eq(@user)
    end
    it "authenticate_with_credentials fails if incorrect password" do
      @user = User.new
      @user.first_name = "fname"
      @user.last_name = "lname"
      @user.email = "example@domain.com"
      @user.password = "password"
      @user.password_confirmation = "password"
      @user.save!
      expect(User.authenticate_with_credentials(@user.email, "shallnotpass")).to eq(nil)
    end

  end
  
end
