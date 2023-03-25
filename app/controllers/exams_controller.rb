class ExamsController < ApplicationController
  before_action :set_exam, only: %i[show edit update destroy]
  before_action :logged_in_user

  def logged_in_user
    return if logged_in?

    flash[:danger] = 'Please log in.'
    redirect_to login_url
  end

  def index
    @exams ||= Exam.all.includes(:department)
  end

  def details
    @exams = Exam.where.not(title: 'Demo Test').includes(:questions, :department)
    @exam_questions_count = @exams.map { |exam| [exam.id, exam.questions.size] }.to_h
  end

  def show; end

  def new
    @exam = Exam.new
  end

  def create
    @exam = current_user.exams.new(exam_params)
    if @exam.save
      redirect_to exams_path, flash: { notice: 'Exam Added' }
    else
      render :new
    end
  end

  def edit; end

  def update
    if @exam.update(exam_params)
      redirect_to exams_path, flash: { notice: 'Exam Added' }
    else
      render :edit
    end
  end

  def destroy
    @exam.destroy
    redirect_to exams_path, flash: { notice: 'Exam Deleted' }
  end

  def demo_attempt
    @exam = Exam.find_by(title: 'Demo Test')
    @examid = @exam.id
    @questions = @exam.questions
    session[:demo_answers] ||= {}
  end

  def demo_calculate_score
    flash[:success] = 'Thanks for taking the test!'
    redirect_to new_registration_path
  end

  private

  def set_exam
    @exam = Exam.includes(:questions).find(params[:id])
  end

  def exam_params
    params.require(:exam).permit(:title, :start_time, :duration, :department_id)
  end
end
