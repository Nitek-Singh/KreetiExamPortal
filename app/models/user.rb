class User < ApplicationRecord
  belongs_to :college

  has_many :registrations
  has_many :exams

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true

  has_secure_password
end
