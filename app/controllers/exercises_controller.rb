class ExercisesController < ApplicationController
  before_action :get_exercise, only: [ :edit, :destroy, :update, :show ]
  before_action :authorize_user, only: [ :edit, :destroy, :update ]
  before_action :authenticate_user!
  def index
    @exercises = Exercise.includes(:user).all
  end
  def show
  end
  def new
    @exercise = current_user.exercises.new
  end
  def create
    @exercise = current_user.exercises.new(exercise_parms)
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

  def authorize_user
    if @exercise.nil? || @exercise.user != current_user
      redirect_to exercises_path, alert: "You are not authorized to edit or delete this exercise."
    end
  end
end
