class Department < ApplicationRecord
  has_many :exams, dependent: :restrict_with_error
  has_many :registrations, dependent: :restrict_with_error

  validates :name, presence: true, length: { minimum: 4, maximum: 50 }
end
