class DashboardsController < ApplicationController

  before_action :logged_in_user

  def logged_in_user
    unless logged_in?
      flash[:danger] = "Please log in."
      redirect_to login_url
    end

    def show
      @registrations = current_user.registrations.where.not(score: nil)
    end
  end

  end
  