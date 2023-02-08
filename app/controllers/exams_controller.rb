class ExamsController < ApplicationController
    
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
    
        private
    
        def set_Exam
          @exam ||= Exam.find(params[:id])
        end
    
        def exam_params
          params.require(:exam).permit(:title, :start_time, :duration)
        end
      end
