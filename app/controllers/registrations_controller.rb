class RegistrationsController < ApplicationController

  before_action :set_registration, only: [:show, :edit, :update, :destroy, :attempt, :calculate_score]
  before_action :verify_user, only: [:attempt]
  before_action :logged_in_user

  def logged_in_user
    unless logged_in?
      flash[:danger] = "Please log in."
      redirect_to login_url
    end
  end

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
          redirect_to schedule_dashboard_path(current_user), flash: { success: 'Successfully Registered!' }
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

      def attempt
        @registration = Registration.find(params[:id])
        @questions = @registration.exam.questions.shuffle
        # Convert the exam start time to IST
        exam_start_time = @registration.exam.start_time.in_time_zone('New Delhi')

        # Check if the current time is before the exam start time
        if Time.zone.now < exam_start_time
        flash[:warning] = "This exam is not yet available. Please check back at #{exam_start_time.strftime('%m/%d/%Y %I:%M %p %Z')}."
        redirect_to schedule_dashboard_path and return
        end
      end

      def calculate_score
        answers = params[:answers]
        if answers.present?
          score = 0
          answers.each do |question_id, answer|
            question = Question.find(question_id)
            score += 10 if question.answer == answer
          end
          @registration.score = score
          @registration.save
          redirect_to dashboards_path, notice: "Your score is #{score}"
        else
          flash.now[:warning] = "Please answer at least one question."
          redirect_back(fallback_location: root_path)
        end
      end               
      
  private

  def set_registration
    if params[:id]
      @registration = Registration.find(params[:id])
    else
      @registration = Registration.find(params[:registration_id])
    end
  end

  def verify_user
    unless @registration.user == current_user
      redirect_to root_path, alert: "You cannot attempt this exam."
    end
  end

  def registration_params
    params.require(:registration).permit(:exam_id, :score)
  end
    
end
