class Exercise < ApplicationRecord
  has_many :workout_exercises
  has_many :workouts, through: :workout_exercises

  belongs_to :user

  has_rich_text :description
  validates :name, presence: true
end
