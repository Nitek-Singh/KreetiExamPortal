class Department < ApplicationRecord
    has_many :exams, dependent: :destroy
    has_many :registrations
end