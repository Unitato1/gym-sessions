class Workout < ApplicationRecord
  belongs_to :user

  has_many :workout_exercises, dependent: :destroy
  has_many :exercises, through: :workout_exercises

  has_many :likes_workouts, dependent: :destroy
  has_many :likers, through: :likes_workouts, source: "user"

  accepts_nested_attributes_for :workout_exercises, allow_destroy: true

  validates :name, presence: true
end
