require 'rails_helper'

RSpec.describe User, type: :model do
  before do 
    @user = User.create(first_name: "john", last_name: "snow", email: 'test@keppo.com', password: "123123", password_confirmation: "123123")
  end
  describe 'creation' do 
    it "can be created" do 
      expect(@user).to be_valid
    end
    it 'can not be created without first_name and last_name' do 
      @user.first_name = nil
      @user.last_name = nil
      expect(@user).to_not be_valid
    end
  end

  describe 'custom name methods' do
    it 'has a full name methods that combines first_name and last_name' do 
      expect(@user.full_name).to eq("SNOW, JOHN")
    end
  end
end
