class RegistrationsController < ApplicationController

    def index
        @registrations = Registration.all
      end
    
      def show
        @registration = Registration.find(params[:id])
     end

    def new
        @registration = Registration.new(user: current_user)
      end
    
      def create
        @registration = Registration.new(registration_params.merge(user: current_user))
        if @registration.save
          redirect_to @registration, notice: 'Registration was successfully created.'
        else
          render :new
        end
      end

      def edit; end

      def update
        if @registration.update(registration_params)
          redirect_to @registration, notice: 'Registration was successfully updated.'
        else
          render :edit
        end
      end
    
      def destroy
        @registration.destroy
        redirect_to registrations_url, notice: 'Registration was successfully destroyed.'
      end

      private

  def registration_params
    params.require(:registration).permit(:exam_id)
  end
    
end
