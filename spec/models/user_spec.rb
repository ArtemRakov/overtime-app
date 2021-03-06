require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.create(:user)
  end
  describe 'creation' do
    it "can be created" do
      expect(@user).to be_valid
    end
  end

  describe 'validations' do
    it 'can not be created without first_name' do
      @user.first_name = nil
      expect(@user).to_not be_valid
    end

    it 'can not be created without last_name' do
      @user.last_name = nil
      expect(@user).to_not be_valid
    end

    it 'can not be created without phone' do
      @user.phone = nil
      expect(@user).to_not be_valid
    end

    it 'phone can only have integers' do
      @user.phone = 'mygreatstr'
      expect(@user).to_not be_valid
    end

    it 'phone attr only have 10 chars' do
      @user.phone = '12345678901'
      expect(@user).to_not be_valid
    end

    it 'requires ssn' do
      @user.ssn = nil
      expect(@user).to_not be_valid
    end

    it 'ssn can only have integers' do
      @user.ssn = 'he12'
      expect(@user).to_not be_valid
    end

    it 'ssn attr only have 4 chars' do
      @user.ssn = 12345
      expect(@user).to_not be_valid
    end

    it 'requires a company' do
      @user.company = nil
      expect(@user).to_not be_valid
    end
  end

  describe 'custom name methods' do
    it 'has a full name methods that combines first_name and last_name' do
      expect(@user.full_name).to eq("SNOW, JON")
    end
  end

  describe 'relationship between admin and employees' do
    it 'allows for admins to be associated with multiple employees' do
      employee_1 = FactoryBot.create(:user)
      employee_2 = FactoryBot.create(:user)
      admin = FactoryBot.create(:admin_user)
      Hand.create!(user: admin, hand: employee_1)
      Hand.create!(user: admin, hand: employee_2)

      expect(admin.hands.count).to eq(2)
    end
  end
end
