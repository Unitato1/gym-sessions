class WorkoutExercise < ApplicationRecord
  belongs_to :workout
  belongs_to :exercise

  validates :sets, presence: true, inclusion: { in: 1..10, message: "range is 1-10" }
  # for plans and holding exercises
  validates :reps, presence: true, inclusion: { in: 1..120, message: "range is 1-120" }
end
