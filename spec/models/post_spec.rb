require 'rails_helper'

RSpec.describe Post, type: :model do
  describe "Creation" do 
    before do 
      @post = Post.create(rationale: "hello world", date: Date.today)
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
