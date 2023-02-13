class DashboardsController < ApplicationController

  before_action :logged_in_user

  def logged_in_user
    unless logged_in?
      flash[:danger] = "Please log in."
      redirect_to login_url
    end

    def show
      @user = User.find(params[:id])
    end
  end
  end
  