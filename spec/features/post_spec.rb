require 'rails_helper'

describe 'navigate' do
  describe 'index' do 
    it 'can be reached successfully' do 
      visit posts_path
      expect(page.status_code).to eq(200)
    end
    it 'has a title of Posts' do 
      visit posts_path
      expect(page).to have_content(/Posts/)
    end
  end
end

describe 'creation' do 
  before do 
    visit new_post_path
    user = User.create(first_name: "john", last_name: "snow", email: 'test@keppo.com', password: "123123", password_confirmation: "123123")
    login_as(user, :scope => :user)
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