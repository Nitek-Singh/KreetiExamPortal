class QuestionsController < ApplicationController

    def index
        @questions = @exam.questions
    end

    def show
        @question = @exam.questions.find(params[:id])
      end
    
    def new
        @exam = Exam.find(params[:exam_id])
        @question = @exam.questions.new
        
    end

    def create
        @exam = Exam.find(params[:exam_id])
        @question = @exam.questions.new(question_params)
            if @question.save
                redirect_to exams_path, flash: { notice: 'Question Added' }
                
            else
                render :new
            end
        end

        def edit
            @exam = Exam.find(params[:exam_id])
            @question = @exam.questions.find(params[:id])
          end
     
    def update
        @exam = Exam.find(params[:exam_id])
        @question = @exam.questions.find(params[:id])
     if @question.update(question_params)
        redirect_to exams_path, flash: { notice: 'Question Updated' }
    else
        render :edit
    end
end

def question_params
    params.require(:question).permit(:question, :answer, :option_1, :option_2, :option_3, :exam_id)
end

end
