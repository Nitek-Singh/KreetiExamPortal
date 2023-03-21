class RegistrationsController < ApplicationController
  before_action :set_registration, only: %i[show edit update destroy attempt calculate_score]
  before_action :verify_user, only: [:attempt]
  before_action :logged_in_user

  def logged_in_user
    return if logged_in?

    flash[:danger] = 'Please log in.'
    redirect_to login_url
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
    exam_ids = registration_params[:exam_ids].reject(&:blank?)
    if exam_ids.blank?
      flash.now[:warning] = 'Please select at least one exam.'
      render :new
      return
    end

    exam_ids.each do |exam_id|
      registration = Registration.new(registration_params.except(:exam_ids).merge(user: current_user,
                                                                                  exam_id:))
      next if registration.save

      flash[:warning] =
"Failed to register for #{registration.exam.title}. #{registration.errors.full_messages.join(', ')}"
      render :new
      return
    end

    redirect_to schedule_dashboard_path(current_user), flash: { success: 'Successfully registered!' }
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
    return unless Time.zone.now < exam_start_time

    flash[:warning] =
"This exam is not yet available. Please check back at #{exam_start_time.strftime('%m/%d/%Y %I:%M %p %Z')}."
    redirect_to schedule_dashboard_path and return
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
      flash.now[:warning] = 'Please answer at least one question.'
      redirect_back(fallback_location: root_path)
    end
  end

  private

  def set_registration
    @registration = Registration.find(params[:id] || params[:registration_id])
  end

  def verify_user
    return if @registration.user == current_user

    redirect_to root_path, alert: 'You cannot attempt this exam.'
  end

  def registration_params
    params.require(:registration).permit(:user_id, :department_id, :score, exam_ids: [])
  end
end
