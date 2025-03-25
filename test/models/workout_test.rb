require "test_helper"

class WorkoutTest < ActiveSupport::TestCase
  test "should not save workout without a name" do
    workout = Workout.new
    assert_not workout.save, "Saved the workout without a name"
  end

  test "should belong to a user" do
    user = users(:one)
    workout = user.workouts.build(name: "Leg Day")
    assert workout.save, "Failed to save a valid workout"
  end
end
