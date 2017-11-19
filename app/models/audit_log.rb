class AuditLog < ApplicationRecord
  belongs_to :user

  validates :start_date, :status, presence: true
  after_initialize :set_defaults

  scope :by_start_date, ->{order(start_date: :desc)}
  enum status: { pending: 0, confirmed: 1 }

  before_update :set_end_date, if: :confirmed?

  private

  def set_end_date
    self.end_date = Date.today
  end

  def set_defaults
    self.start_date ||= Date.today - 6.days
  end
end
