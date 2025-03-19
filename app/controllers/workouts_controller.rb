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

  def edit
    @workout = Workout.find(params[:id])
    if @workout.workout_exercises.empty?
      @workout_exercises = @workout.workout_exercises.build
    else
      @workout_exercises = @workout.workout_exercises
    end
    @exercises = Exercise.all
  end

  def new
    @workout = Workout.new
    if @workout.workout_exercises.empty?
      @workout_exercises = @workout.workout_exercises.build
    else
      @workout_exercises = @workout.workout_exercises
    end
    @exercises = Exercise.all
  end

  def create
    @workout = Workout.new(workout_params)
    if @workout.save
      redirect_to @workout
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @workout = Workout.find(params[:id])
    if @workout.destroy
      redirect_to workouts_path
    else
      render @workout, status: :unprocessable_entity
    end
  end

  private

  def workout_params
    params.require(:workout).permit(:name, workout_exercises_attributes: [ :id, :exercise_id, :sets, :reps, :_destroy ])
  end
end
