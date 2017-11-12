FactoryBot.define do
  factory :post do
    date Date.today.strftime("%m/%d/%Y")
    rationale "Some rationale"
    user
  end

  factory :second_post, class: "Post" do
    date Date.yesterday.strftime("%m/%d/%Y")
    rationale "Some content"
    user
  end
end