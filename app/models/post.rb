class Post < ApplicationRecord
  belongs_to :user
  validates :rationale, :date, :overtime_request, presence: true
  validates :overtime_request, numericality: { greater_than: 0.0 }
  enum status: { submitted: 0, approved: 1, rejected: 2 }

  scope :posts_by, ->(user) { where(user: user) }

  after_save :confirm_audit_log if :submitted?
  after_save :un_confirm_audit_log if :rejected?

  private
    def un_confirm_audit_log
      audit_log = AuditLog.where(user: self.user, start_date: (self.date - 7.days..self.date)).last
      audit_log&.pending!
    end

    def confirm_audit_log
      audit_log = AuditLog.where(user: self.user, start_date: (self.date - 7.days..self.date)).last
      audit_log&.confirmed!
    end
end
