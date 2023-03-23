class CollegesController < ApplicationController
  before_action :set_college, only: %i[edit update destroy]

  def index
    @colleges = College.all
  end

  def new
    @college = College.new
  end

  def create
    @college = College.new(college_params)
    if @college.save
      redirect_to colleges_path, notice: 'College was successfully created.'
    else
      render :new
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
    @college.destroy
    redirect_to colleges_path, notice: 'College was successfully destroyed.'
  end

  private

  def set_college
    @college = College.find(params[:id])
  end

  def college_params
    params.require(:college).permit(:name)
  end
end
