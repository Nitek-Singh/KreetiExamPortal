class LeaderboardsController < ApplicationController
  def index
    @departments = Department.all
    @exams = Exam.includes(registrations: :user).with_scores
  end
end
