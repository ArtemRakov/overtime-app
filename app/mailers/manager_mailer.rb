class ManagerMailer < ApplicationMailer
  def mail(manager)
    @manager = manager
    mail(to: manager.email, subject: 'Daily overtime Request email')
  end
end
