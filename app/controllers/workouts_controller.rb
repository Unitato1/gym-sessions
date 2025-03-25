class WorkoutsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_workout, only: [ :destroy, :edit, :update, :show, :like, :unlike ]
  before_action :authorize_user, only: [ :edit, :update, :destroy ]

  def index
    @workouts = Workout.includes(:user).all
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
      @workout_exercises = [ @workout.workout_exercises.build ]
    else
      @workout_exercises = @workout.workout_exercises
    end
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
    name = @workout.name
    @workout.destroy
    if @workout.destroyed?
      redirect_to workouts_path, alert: "Deleted " + name + " workout!"
    else
      render @workout, status: :unprocessable_entity
    end
  end

  def like
    @workout = Workout.find(params[:id])
    if current_user.likes << @workout
      redirect_to current_user, alert: "Workout liked!"
    else
      redirect_to workout_path(@workout), alert: "Something went wrong."
    end
  end
  def like
    @like = current_user.likes_workout.build(workout: @workout)
    if @like.save
      redirect_to current_user, alert: "Liked #{@workout.name}"
    else
      redirect_back fallback_location: current_user, alert: "You already liked #{@workout.name}."
    end
  end

  def unlike
    if current_user.likes.exists?(@workout.id)
      if current_user.likes.destroy(@workout)
        redirect_to current_user, alert: "Unliked #{@workout.name}"
      else
        redirect_back fallback_location: current_user, alert: "Something went wrong."
      end
    else
      redirect_back fallback_location: current_user, alert: "The #{@workout.name} is not liked by you"
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
