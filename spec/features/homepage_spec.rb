require 'rails_helper'

describe 'homepage' do
  it 'allows the admin to approve posts from the homepage' do
    post = FactoryBot.create(:post)
    admin_user = FactoryBot.create(:admin_user)
    login_as(admin_user, scope: :user)

    visit root_path
    click_link("approve-#{post.id}")

    expect(post.reload.status).to eq("approved")
  end

   it 'allows the admin to approve posts from the homepage' do
    user = FactoryBot.create(:user)
    audit_log = FactoryBot.create(:audit_log)
    audit_log.update(user: user)

    login_as(user, scope: :user)

    visit root_path
    click_link("confirm_#{audit_log.id}")

    expect(audit_log.reload.status).to eq("confirmed")
  end
end
