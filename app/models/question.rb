class Question < ApplicationRecord
  belongs_to :exam

  validates :question, :answer, :option_1, :option_2, :option_3, :exam_id, presence: true
  validate :answer_in_options

  private

  def answer_in_options
    return if [option_1, option_2, option_3].include?(answer)

    errors.add(:answer, 'must match one of the options')
  end
end
