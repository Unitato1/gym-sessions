class WorkoutsController < ApplicationController
  def index
    @workouts = Workout.all
  end

  def show
    @workout = Workout.find(params[:id])
    @workout_exercises = @workout.workout_exercises
  end

  def update
    @workout = Workout.find(params[:id])
    if @workout.update(workout_params)
      redirect_to @workout, notice: "Workout updated successfully."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def workout_params
    params.require(:workout).permit(:name)
  end
end
