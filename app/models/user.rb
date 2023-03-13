class User < ApplicationRecord
  belongs_to :college

  has_many :registrations
  has_many :exams

  has_secure_password

  validates :name, :email, presence: true
  validates :admin, inclusion: { in: [true, false] }
  validates :email, uniqueness: true
end
