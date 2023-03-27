class DepartmentsController < ApplicationController
  before_action :set_department, only: %i[show edit update destroy]

  def index
    @departments = Department.all
    @department = Department.new
  end

  def create
    @department = Department.new(department_params)
    if @department.save
      redirect_to departments_path, flash: { success: 'Department added successfully' }
    else
      @departments = Department.all
      render :index
    end
  end

  def show; end

  def edit; end

  def update
    if @department.update(department_params)
      redirect_to departments_path, flash: { success: 'Department was successfully updated.' }
    else
      render :edit
    end
  end

  def destroy
    if @department.exams.present? || @department.registrations.present?
      redirect_to departments_path,
                  flash: { warning: 'Cannot delete Department, It has associated Exams or Registrations' }
    else
      @department.destroy
      redirect_to departments_path, flash: { success: 'Department was successfully deleted.' }
    end
  end

  private

  def set_department
    @department = Department.find(params[:id])
  end

  def department_params
    params.require(:department).permit(:name)
  end
end
