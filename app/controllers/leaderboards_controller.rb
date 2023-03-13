class LeaderboardsController < ApplicationController
  def index
    @departments = Department.all
    @exams = Exam.joins(:registrations)
                 .where.not(registrations: { score: nil })
                 .group(:department_id, :id)
                 .order('MAX(registrations.score) DESC')
  end  
end