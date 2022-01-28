require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it "is not valid if password and password_confirmation do not match" do
      @user = User.new
      @user.first_name = "brett"
      @user.last_name = "jarvis"
      @user.email = "email@email.com"
      @user.password = "password"
      @user.password_confirmation = "notpassword"
      expect(@user).to_not be_valid
    end
    it "is valid if password and password_confirmation match" do
      @user = User.new
      @user.first_name = "brett"
      @user.last_name = "jarvis"
      @user.email = "email@email.com"
      @user.password = "password"
      @user.password_confirmation = "password"
      expect(@user).to be_valid
    end
    it "is not valid if email is not unique" do
      @user = User.new
      @user.first_name = "brett"
      @user.last_name = "jarvis"
      @user.email = "email@email.com"
      @user.password = "password"
      @user.password_confirmation = "password"
      @user.save!
      @user = User.new
      @user.first_name = "brett"
      @user.last_name = "jarvis"
      @user.email = "email@email.com"
      @user.password = "password"
      @user.password_confirmation = "password"
      expect(@user).to_not be_valid
    end
    it "is not valid if any first_name empty" do
      @user = User.new
      @user.first_name = ""
      @user.last_name = "jarvis"
      @user.email = "email@email.com"
      @user.password = "password"
      @user.password_confirmation = "password"
      expect(@user).to_not be_valid
    end
    it "is not valid if any last_name empty" do
      @user = User.new
      @user.first_name = "brett"
      @user.last_name = ""
      @user.email = "email@email.com"
      @user.password = "password"
      @user.password_confirmation = "password"
      expect(@user).to_not be_valid
    end
    it "is not valid if any email empty" do
      @user = User.new
      @user.first_name = "brett"
      @user.last_name = "jarvis"
      @user.email = ""
      @user.password = "password"
      @user.password_confirmation = "password"
      expect(@user).to_not be_valid
    end
    it "is not valid if any password_confirmation empty" do
      @user = User.new
      @user.first_name = "brett"
      @user.last_name = "jarvis"
      @user.email = "email@email.com"
      @user.password = "password"
      @user.password_confirmation = ""
      expect(@user).to_not be_valid
    end
    it "is not valid if password less that 6 characters" do
      @user = User.new
      @user.first_name = "brett"
      @user.last_name = "jarvis"
      @user.email = "email@email.com"
      @user.password = "pswrd"
      @user.password_confirmation = "pswrd"
      expect(@user).to_not be_valid
    end
  end
end
