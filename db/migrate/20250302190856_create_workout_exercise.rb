class CreateWorkoutExercise < ActiveRecord::Migration[8.0]
  def change
    create_table :workout_exercises do |t|
      t.references :exercise
      t.references :workout
      t.integer :sets
      t.integer :reps

      t.timestamps
    end
  end
end
