class UsersController < ApplicationController
  before_action :authenticate_user!
  def show
    @user = User.find_by(id: params[:id])
    if @user
      @workouts = @user.workouts
      @liked_workouts = @user.likes
    else
      flash[:alert] = "User not found"
      redirect_to root_path
    end
  end
end
