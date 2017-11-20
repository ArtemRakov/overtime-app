FactoryBot.define do
  factory :post do
    date Date.today
    work_performed "Some work_performed"
    daily_hours 12.5
    user
  end

  factory :second_post, class: "Post" do
    date Date.yesterday
    work_performed "Some content"
    daily_hours 8.0
    user
  end

  factory :post_from_other_user, class: "Post" do
    date Date.yesterday
    work_performed "Some content"
    daily_hours 3.5
    user
  end
end
