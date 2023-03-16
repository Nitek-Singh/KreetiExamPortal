class DepartmentsController < ApplicationController
    before_action :set_department, only: [:show, :edit, :update, :destroy]
  
    def index
      @departments = Department.all
      @department = Department.new
    end
  
    def create
      @department = Department.new(department_params)
      if @department.save
        redirect_to departments_path, notice: "Department was successfully created."
      else
        @departments = Department.all
        render :index
      end
    end
  
    def show
    end
  
    def edit
    end
  
    def update
      if @department.update(department_params)
        redirect_to departments_path, notice: "Department was successfully updated."
      else
        render :edit
      end
    end
  
    def destroy
      @department.destroy
      redirect_to departments_path, notice: "Department was successfully deleted."
    end
  
    private
  
    def set_department
      @department = Department.find(params[:id])
    end
  
    def department_params
      params.require(:department).permit(:name)
    end
  end  