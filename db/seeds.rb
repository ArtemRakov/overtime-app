
user = User.create(first_name: "john",
                    last_name: "snow",
                    email: 'test@test.com',
                    password: "123123",
                    password_confirmation: "123123",
                    phone: "1234567890")


user = AdminUser.create(first_name: "Admin",
                    last_name: "Test",
                    email: 'admin@test.com',
                    password: "123123",
                    password_confirmation: "123123",
                    phone: "1234567890")

puts "Admin and User was created"

100.times do |post|
  Post.create!(date: Date.today, rationale: "#{post} rationale content", user: user, overtime_request: 2.5)
  AuditLog.create!(user: user, start_date: (Date.today - 6.days))
end

puts "100 Post have been created"
