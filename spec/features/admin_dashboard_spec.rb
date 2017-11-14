require 'rails_helper'

describe 'admin dashboard' do
  it 'can be reached by admin' do
    user = FactoryBot.create(:admin_user)
    login_as(user, :scope => :user)

    visit admin_root_path
    expect(current_path).to eq(admin_root_path)
  end

  it 'can not be reached by not signed in users' do
    visit admin_root_path
    expect(current_path).to eq(new_user_session_path)
  end

  it 'can not be reached by not admin users' do
    user = FactoryBot.create(:user)
    login_as(user, :scope => :user)

    visit admin_root_path

    expect(current_path).to eq(root_path)
  end
end
