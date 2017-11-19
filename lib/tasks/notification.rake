namespace :notification do
  desc "Send SMS notification to employees asking them to log if they had overtime or not"
  task sms: :environment do
    if Time.now.sunday?

    end
  end

  desc "Send Mail notification to managers(admin users) each day"
  task manager_email: :environment do
    sumitted_posts = Post.submitted
    admin_user = AdminUser.all

    if sumitted_posts.any?
      admin_user.each do |admin|
        ManagerMailer.email(admin).deliver_now
      end
    end
  end
end
