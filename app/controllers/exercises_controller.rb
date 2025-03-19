class ExercisesController < ApplicationController
  before_action :get_exercise, only: [ :edit, :destroy, :update, :show ]
  def index
    @exercises = Exercise.all
  end
  def show
  end
  def new
    @exercise = Exercise.new
  end
  def create
    if @exercise.save
      redirect_to @exercise
    else
      render :new, status: :unprocessable_entity
    end
  end
  def update
    if @exercise.update(exercise_parms)
      redirect_to @exercise
    else
      render :edit, status: :unprocessable_entity
    end
  end
  def edit
  end

  def destroy
    if @exercise.destroy
      redirect_to exercises_path
    else
      render @exercise
    end
  end
  private
  def exercise_parms
    params.require(:exercise).permit(:name, :description)
  end
  def get_exercise
    @exercise = Exercise.find(params[:id])
  end
end
