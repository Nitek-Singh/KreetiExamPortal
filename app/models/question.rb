class Question < ApplicationRecord
  belongs_to :exam

  validates :question, :answer, :option_1, :option_2, :option_3, :exam_id, presence: true
end
