require "test_helper"

class ExerciseTest < ActiveSupport::TestCase
  test "should not save workout without a name" do
    exercise = Exercise.new
    assert_not exercise.save, "Saved the exercise without a name"
  end

  test "should save exercise with a name" do
    exercise = Exercise.new(name: "testName")
    assert_not exercise.save, "Did save the workout with a name but without user"
  end


  test "should belong to a user" do
    user = users(:one)
    exercise = user.exercises.build(name: "Leg Day")
    assert exercise.save, "Failed to save a valid exercise"
  end

  test "should not belong to a user" do
    user = users(:one)
    exercise = user.exercises.build()
    assert_not exercise.save, "Saved a invalid exercise with user without name"
  end
end
