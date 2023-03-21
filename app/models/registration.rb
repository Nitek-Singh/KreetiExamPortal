class Registration < ApplicationRecord
  belongs_to :user
  belongs_to :exam
  belongs_to :department

  validates :user_id, :department_id, :exam_id, presence: true
  validates :user_id, uniqueness: { scope: :exam_id, message: 'has already registered for this exam' }
end
