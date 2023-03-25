class User < ApplicationRecord
  belongs_to :college

  has_many :registrations
  has_many :exams

  has_secure_password

  validates :name, presence: true, length: { minimum: 4, maximum: 20 }
  validates :college_id, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.(com|ac\.in)\z/i, message: "invalid format" }
  validates :admin, inclusion: { in: [true, false] }
  validates :password, presence: true, length: { minimum: 4, maximum: 10 }, confirmation: true
end