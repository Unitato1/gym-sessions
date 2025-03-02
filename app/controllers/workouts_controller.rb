class WorkoutsController < ApplicationController
  def show
      @workout = Workout.find(params[:id])
      @workout_exercises = @workout.workout_exercises
  end
end