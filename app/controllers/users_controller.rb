class UsersController < ApplicationController
  before_action :authenticate_user!
  def show
    @workouts = current_user.workouts
  end
end
