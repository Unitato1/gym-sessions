class LikesWorkout < ApplicationRecord
  belongs_to :user
  belongs_to :workout

  validates :user_id, uniqueness: { scope: :workout_id, message: "You can only like this workout once" }
end
