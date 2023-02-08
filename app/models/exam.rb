class Exam < ApplicationRecord
  has_many :questions
  has_many :registrations
  belongs_to :user
end
