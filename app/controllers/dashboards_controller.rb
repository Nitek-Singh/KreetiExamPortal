class DashboardsController < ApplicationController
  before_action :logged_in_user

  def logged_in_user
    unless logged_in?
      flash[:danger] = "Please log in."
      redirect_to login_url
  end
   
  def index
    @exam_groups = current_user.registrations.includes(:exam).group_by { |registration| registration.exam }
  end

  def show
      @registrations = current_user.registrations.where.not(score: nil)
    end
  end

  def schedule
    @registrations = current_user.registrations.includes(:exam)
    @exam = Exam.find_by(title: "Demo Test")
  end 
end