
user = User.create(first_name: "john", last_name: "snow", email: 'test@test.com', password: "123123", password_confirmation: "123123")

puts "User was created"

100.times do |post|
  Post.create(date: Date.today, rationale: "#{post} rationale content", user: user, overtime_request: 2.5)
end

puts "100 Post have been created"
