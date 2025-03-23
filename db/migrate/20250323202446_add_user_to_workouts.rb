class AddUserToWorkouts < ActiveRecord::Migration[8.0]
  def change
    add_reference :workouts, :user, null: false, foreign_key: true, index: true
  end
end
