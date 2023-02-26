class Exam < ApplicationRecord
  has_many :questions
  has_many :registrations, dependent: :destroy

  belongs_to :user

  validates :title, :start_time, :duration, :user_id, presence: true
end
