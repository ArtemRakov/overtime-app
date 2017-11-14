class Post < ApplicationRecord
  belongs_to :user
  validates :rationale, :date, presence: true
  enum status: { Submitted: 0, Approved: 1, Rejected: 2 }
end
