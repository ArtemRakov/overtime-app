require 'rails_helper'

describe 'navigate' do
  before do 
    @user = User.create(first_name: "john", last_name: "snow", email: 'test@keppo.com', password: "123123", password_confirmation: "123123")
    login_as(@user, :scope => :user)
    visit new_post_path
  end
  describe 'index' do 
    before do 
      visit posts_path
    end
    it 'can be reached successfully' do 
      expect(page.status_code).to eq(200)
    end

    it 'has a title of Posts' do 
      expect(page).to have_content(/Posts/)
    end

    it 'has a list of posts' do
      post1 = Post.create(rationale: "Post1", date: Date.today, user: @user)
      post2 = Post.create(rationale: "Post2", date: Date.today, user: @user)
      visit posts_path
      expect(page).to have_content(/Post1|Post2/)
    end
  end
end

describe 'creation' do 
  before do 
    user = User.create(first_name: "john", last_name: "snow", email: 'test@keppo.com', password: "123123", password_confirmation: "123123")
    login_as(user, :scope => :user)
    visit new_post_path
  end
  it 'has a new form that can be reached' do 
    expect(page.status_code).to eq(200)
  end

  it 'can be created from new from page' do 
    fill_in 'post[date]', with: Date.today.strftime("%m/%d/%Y")
    fill_in 'post[rationale]', with: "Hello"
    click_on "Save"
    expect(page).to have_content("Hello")
  end

  it 'will have user associated it' do 
    fill_in 'post[date]', with: Date.today.strftime("%m/%d/%Y")
    fill_in 'post[rationale]', with: "User Association"
    click_on "Save"

    expect(User.last.posts.last.rationale).to eq("User Association")
  end 
end