class PagesController < ApplicationController
    def home
        @logged_in = logged_in?
      end
      
      private
      
      def logged_in?
        !!current_user
      end
end
