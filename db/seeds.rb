
user = User.create(first_name: "john",
                    last_name: "snow",
                    email: 'test@test.com',
                    password: "123123",
                    password_confirmation: "123123",
                    phone: "1234567890")


admin_user = AdminUser.create(first_name: "Admin",
                    last_name: "Test",
                    email: 'admin@test.com',
                    password: "123123",
                    password_confirmation: "123123",
                    phone: "1234567890")

puts "Admin and User was created"

100.times do |post|
  Post.create!(date: Date.today, rationale: "#{post} rationale content orem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsu", user: user, overtime_request: 2.5)
  AuditLog.create!(user: user, start_date: (Date.today - 6.days))
end

puts "100 Post have been created"
