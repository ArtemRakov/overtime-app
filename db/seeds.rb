
user = Employee.create(first_name: "john",
                    last_name: "snow",
                    email: 'test@test.com',
                    password: "123123",
                    password_confirmation: "123123",
                    phone: "1234567890",
                    ssn: 1234,
                    company: "Ruby")


admin_user = AdminUser.create(first_name: "Admin",
                    last_name: "Test",
                    email: 'admin@test.com',
                    password: "123123",
                    password_confirmation: "123123",
                    phone: "1234567890",
                    ssn: 1234,
                    company: "Ruby")

puts "Admin and User was created"

AuditLog.create!(user: user, start_date: (Date.today - 20.days))
AuditLog.create!(user: user, start_date: (Date.today - 13.days))
AuditLog.create!(user: user, start_date: (Date.today - 6.days))

1.times do |post|
  Post.create!(date: Date.today, work_performed: "#{post} work_performed content orem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsu", user: user, daily_hours: 12.5)
end



puts "100 Post have been created"
