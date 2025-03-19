class WorkoutExercise < ApplicationRecord
  belongs_to :workout
  belongs_to :exercise
  validates :sets, presence: true
  validates :reps, presence: true
end
