class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :first_name, :last_name, :phone, presence: true
  has_many :posts
  has_many :audit_logs

  has_many :hands_associations, class_name: 'Hand'
  has_many :hands, through: :hands_associations

  PHONE_REGEX = /\b^[0-9]{10}\b/

  validates :phone, format: { with: PHONE_REGEX, message: "only allows 10 integers" }
  validates :phone, length: { is: 10 }

  def full_name
    "#{last_name.upcase}, #{first_name.upcase}"
  end
end
