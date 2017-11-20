require 'rails_helper'

RSpec.describe Post, type: :model do
  describe "Creation" do
    before do
      user = FactoryBot.create(:user)
      login_as(user, :scope => :user)
      @post = FactoryBot.create(:post)
    end

    it "can be created" do
      expect(@post).to be_valid
    end

    it "can not be created without date, daily_hours and rationale" do
      @post.date = nil
      @post.rationale = nil
      @post.daily_hours = nil
      expect(@post).to_not be_valid
    end

    it 'has daily_hours greater than 0.0' do
      @post.daily_hours = 0.0
      expect(@post).to_not be_valid
    end
  end
end
