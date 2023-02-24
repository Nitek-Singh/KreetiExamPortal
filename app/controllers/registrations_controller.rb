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

      def attempt
        @registration = Registration.find(params[:id])
        @questions = @registration.exam.questions
        session[:answers] ||= {}
      end
      
      def calculate_score
        score = 0
        answers = params.require(:answers).permit!
        answers.each do |question_id, answer|
          question = Question.find(question_id)
          score += 10 if question.answer == answer
        end
      
        # Save the answers in the session
        session[:answers].merge!(answers)
      
        # Save the score in the database
        @registration.score = score
        @registration.save
        redirect_to @registration, notice: "Your score is #{score}"
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
