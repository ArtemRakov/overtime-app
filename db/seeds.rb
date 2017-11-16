
user = User.create(first_name: "john",
                    last_name: "snow",
                    email: 'test@test.com',
                    password: "123123",
                    password_confirmation: "123123",
                    number: "555")


user = AdmiUser.create(first_name: "Admin",
                    last_name: "Test",
                    email: 'admin@test.com',
                    password: "123123",
                    password_confirmation: "123123",
                    number: "555")

puts "Admin and User was created"

100.times do |post|
  Post.create(date: Date.today, rationale: "#{post} rationale content", user: user, overtime_request: 2.5)
end

puts "100 Post have been created"
