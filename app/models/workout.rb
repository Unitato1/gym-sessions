class Workout < ApplicationRecord
  has_many :workout_exercises
  has_many :exercices, through: :workout_exercises
end
