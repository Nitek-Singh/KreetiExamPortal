class ExamsController < ApplicationController

  before_action :set_exam, only: [:show, :edit, :update, :destroy, :demo_attempt, :demo_calculate_score]
  before_action :logged_in_user

  def logged_in_user
    unless logged_in?
      flash[:danger] = "Please log in."
      redirect_to login_url
    end
  end
    
      def index
        @exams ||= Exam.all
      end

      def show
        @exam = Exam.find(params[:id])
      end
    
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
    
        def edit
          @exam = Exam.find(params[:id])
         end
    
        def update
          @exam = Exam.find(params[:id])
           if @exam.update(exam_params)
            redirect_to exams_path, flash: { notice: 'Exam Added' }
          else
           render :edit
            end
        end
    
        def destroy
          @exam = Exam.find(params[:id])
          @exam.destroy
          redirect_to exams_path, flash: { notice: 'Exam Deleted' }
        end

        def demo_attempt
          @exam = Exam.find_by(title: "Demo Test")
          @questions = @exam.questions
          session[:demo_answers] ||= {}
        end

        def demo_calculate_score
          flash[:success] = "Thanks for taking the test!"
          redirect_to new_registration_path
        end        
        
        private
    
        def set_exam
          @exam = Exam.find(params[:id])
        end
    
        def exam_params
          params.require(:exam).permit(:title, :start_time, :duration)
        end
      end
