require 'rails_helper'

RSpec.describe Post, type: :model do
  describe "Creation" do 
    before do 
      user = User.create(first_name: "john", last_name: "snow", email: 'test@keppo.com', password: "123123", password_confirmation: "123123")
      login_as(user, :scope => :user)
      @post = Post.create(rationale: "hello world", date: Date.today)
      @post.user = user
    end
    
    it "can be created" do 
      expect(@post).to be_valid
    end

    it "can not be created without date and rationale" do 
      @post.date = nil
      @post.rationale = nil
      expect(@post).to_not be_valid
    end
  end
end
