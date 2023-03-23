class Exam < ApplicationRecord
  has_many :questions, dependent: :destroy
  has_many :registrations, dependent: :destroy

  belongs_to :user
  belongs_to :department

  validates :title, :start_time, :duration, :department_id, :user_id, presence: true

  scope :with_scores, lambda {
    left_outer_joins(registrations: :user)
      .where.not(registrations: { score: nil })
      .group('exams.department_id', 'exams.id')
      .order('MAX(registrations.score) DESC')
  }

  def self.with_participations
    left_joins(registrations: { user: :college })
      .select('exams.*, COUNT(registrations.id) as registration_count, COUNT(registrations.id) > 0 as has_registration')
      .group('exams.id')
      .having('registration_count > 0')
      .includes(registrations: { user: :college })
  end
end