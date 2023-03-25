class CollegesController < ApplicationController
  before_action :set_college, only: %i[edit update destroy]

  def index
    @colleges = College.all
    @college = College.new
  end

  def create
    @college = College.new(college_params)
    if @college.save
      redirect_to colleges_path, notice: 'College was successfully created.'
    else
      @colleges = College.all
      render :index
    end
  end

  def edit; end

  def update
    if @college.update(college_params)
      redirect_to colleges_path, notice: 'College was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    if @college.users.present?
      redirect_to colleges_path,  flash: { alert: 'Cannot delete college, It has associated users' }
    else
      @college.destroy
      redirect_to colleges_path, flash: { notice: 'College was successfully destroyed.' }
    end
  end

  private

  def set_college
    @college = College.find(params[:id])
  end

  def college_params
    params.require(:college).permit(:name)
  end
end
