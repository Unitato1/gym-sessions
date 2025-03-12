class CreateWorkout < ActiveRecord::Migration[8.0]
  def change
    create_table :workouts do |t|
      t.string :name
      t.date :start
      t.date :finish

      t.timestamps
    end
  end
end
