class ParticipationsController < ApplicationController
  def index
    @exams = Exam.with_participations
  end
end
