class Post < ApplicationRecord
  belongs_to :user
  validates :rationale, :date, :overtime_request, presence: true
  validates :overtime_request, numericality: { greater_than: 0.0 }
  enum status: { submitted: 0, approved: 1, rejected: 2 }

  scope :posts_by, ->(user) { where(user: user) }
end
