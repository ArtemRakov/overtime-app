class Post < ApplicationRecord
  belongs_to :user
  validates :rationale, :date, presence: true
  enum status: { submitted: 0, approved: 1, rejected: 2 }
end
