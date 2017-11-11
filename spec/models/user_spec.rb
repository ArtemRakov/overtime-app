require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'creation' do 
    before do 
      @user = User.create(first_name: "john", last_name: "snow", email: 'test@keppo.com', password: "123123", password_confirmation: "123123")
    end
    it "can be created" do 
      expect(@user).to be_valid
    end
    it 'can not be created without first_name and last_name' do 
      @user.first_name = nil
      @user.last_name = nil
      expect(@user).to_not be_valid
    end
  end
end