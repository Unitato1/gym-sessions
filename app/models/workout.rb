class Workout < ApplicationRecord
  has_many :workout_exercises
  has_many :exercises, through: :workout_exercises
  belongs_to :user

  accepts_nested_attributes_for :workout_exercises, allow_destroy: true
  validates :name, presence: true
end
