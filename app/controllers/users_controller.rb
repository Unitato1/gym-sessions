class UsersController < ApplicationController
  before_action :authenticate_user!
  def show
    @workouts = current_user.workouts
    @liked_workouts = current_user.likes
  end
end
