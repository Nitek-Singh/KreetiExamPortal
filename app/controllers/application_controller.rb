class ApplicationController < ActionController::Base


    def require_admin(redirect_path)
        redirect_to redirect_path, flash: { warning: 'This user does not have permission.' } unless current_user.admin?
      end
    
      def current_user
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
      end
    
      def logged_in
        redirect_to login_path, flash: { error: 'Login to Book Tickets' } if current_user.nil?
      end
end
