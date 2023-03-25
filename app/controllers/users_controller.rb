class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to login_path, flash: { success: 'Account Created, Please log in' }
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = 'Your account information was successfully updated'
      redirect_to root_path
    else
      render 'edit'
    end
  end

  def destroy
    @user.destroy
    flash[:notice] = 'User deleted'
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :college_id, :password, :password_confirmation, :description,
                                 :linkedin_url)
  end
end
