class WorkoutsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_workout, only: [ :destroy, :edit, :update, :show ]
  before_action :authorize_user, only: [ :edit, :update, :destroy ]

  def index
    @workouts = Workout.all
  end

  def show
    @workout_exercises = @workout.workout_exercises
  end

  def update
    if @workout.update(workout_params)
      redirect_to @workout, notice: "Workout updated successfully."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def edit
    if @workout.workout_exercises.empty?
      @workout_exercises = @workout.workout_exercises.build
    else
      @workout_exercises = @workout.workout_exercises
    end
    @exercises = Exercise.all
  end

  def new
    @workout = current_user.workouts.new
    if @workout.workout_exercises.empty?
      @workout_exercises = @workout.workout_exercises.build
    else
      @workout_exercises = @workout.workout_exercises
    end
    @exercises = Exercise.all
  end

  def create
    @workout = current_user.workouts.new(workout_params)
    if @workout.save
      redirect_to @workout
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
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
  def find_workout
    @workout = Workout.find(params[:id])
  end
  def authorize_user
    if @workout.user != current_user
      redirect_to workouts_path, alert: "You are not authorized to edit or delete this workout."
    end
  end
end
