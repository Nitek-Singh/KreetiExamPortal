class Exam < ApplicationRecord
  has_many :questions, dependent: :destroy
  has_many :registrations, dependent: :destroy

  belongs_to :user
  belongs_to :department

  validates :title, :start_time, :duration, :department_id, :user_id, presence: true
end
