class DashboardsController < ApplicationController
  before_action :logged_in_user

  def logged_in_user
    unless logged_in?
      flash[:danger] = "Please log in."
      redirect_to login_url
  end
   
  def index
    registrations = current_user.registrations.includes(:user, :exam)
    @exam_groups = registrations.group_by(&:exam)
    @college_groups = registrations.where.not(users: { college_id: nil })
                                    .group_by { |r| r.user.college }
                                    .transform_values do |regs|
                                      scores = regs.pluck(:score).reject(&:nil?)
                                      { registrations: regs, scores: scores }
                                    end
  
  end

  def show
      @registrations = current_user.registrations.where.not(score: nil)
    end
  end

  def schedule
    @registrations = current_user.registrations.includes(:exam)
  end 
end