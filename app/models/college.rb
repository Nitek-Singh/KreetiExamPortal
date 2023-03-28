class College < ApplicationRecord
  has_many :users, dependent: :restrict_with_error

  validates :name, presence: true, length: { minimum: 4, maximum: 50 }
end
