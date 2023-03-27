class User < ApplicationRecord
  belongs_to :college

  has_many :registrations
  has_many :exams

  has_secure_password

  validates :name, presence: true, length: { minimum: 4, maximum: 30 }
  validates :college_id, presence: true
  validates :email, presence: true, uniqueness: true,
                    format: { with: %r{[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?}, message: 'invalid format' }
  validates :admin, inclusion: { in: [true, false] }
  validates :password, presence: true, length: { minimum: 4, maximum: 20 }, confirmation: true
end
