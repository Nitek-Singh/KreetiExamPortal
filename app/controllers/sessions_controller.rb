class SessionsController < ApplicationController

    def login
        @user = User.new
      end
    
      def create
        user = User.where(email: session_params[:email]).first
        if user && user&.authenticate(session_params[:password])
          session[:user_id] = user.id
          redirect_to exam_details_path, flash: { notice: "Welcome #{user.name}" }
        else
          redirect_to login_path, flash: { warning: 'Check Credentials and Try Again' }
        end
      end
    
      def destroy
        session[:user_id] = nil
        redirect_to login_path, flash: { success: 'Successfully Logged Out!' }
      end
    
      private
    
      def session_params
        params.require(:user).permit(:email, :password)
      end
end  