class LeaderboardsController < ApplicationController
  def index
    @departments = Department.all
    @exams = Exam.includes(registrations: :user).left_outer_joins(registrations: :user)
                 .where.not(registrations: { score: nil })
                 .group('exams.department_id', 'exams.id')
                 .order('MAX(registrations.score) DESC')
  end
end
