# Clear existing data to prevent duplication
WorkoutExercise.destroy_all
Workout.destroy_all
Exercise.destroy_all

# Create exercises
exercises = [
  "Bench Press",
  "Squats",
  "Deadlift",
  "Pull-Ups",
  "Push-Ups",
  "Lunges",
  "Bicep Curls",
  "Tricep Dips",
  "Plank",
  "Russian Twists"
].map { |name| Exercise.create!(name: name) }

# Create workouts
workouts = [
  "Upper Body Strength",
  "Lower Body Power",
  "Full Body Strength",
  "Core & Abs Focus",
  "Beginner Workout"
].map { |name| Workout.create!(name: name) }

# Define workout exercises with sets and reps
workout_exercises = [
  { workout: workouts[0], exercise: exercises[0], sets: 4, reps: 8 }, # Bench Press in Upper Body
  { workout: workouts[0], exercise: exercises[3], sets: 3, reps: 10 }, # Pull-Ups in Upper Body
  { workout: workouts[0], exercise: exercises[6], sets: 3, reps: 12 }, # Bicep Curls in Upper Body

  { workout: workouts[1], exercise: exercises[1], sets: 4, reps: 10 }, # Squats in Lower Body
  { workout: workouts[1], exercise: exercises[5], sets: 3, reps: 12 }, # Lunges in Lower Body
  { workout: workouts[1], exercise: exercises[2], sets: 4, reps: 6 },  # Deadlift in Lower Body

  { workout: workouts[2], exercise: exercises[0], sets: 4, reps: 8 },  # Bench Press in Full Body
  { workout: workouts[2], exercise: exercises[1], sets: 4, reps: 10 }, # Squats in Full Body
  { workout: workouts[2], exercise: exercises[2], sets: 3, reps: 6 },  # Deadlift in Full Body
  { workout: workouts[2], exercise: exercises[3], sets: 3, reps: 10 }, # Pull-Ups in Full Body
  { workout: workouts[2], exercise: exercises[4], sets: 3, reps: 15 }, # Push-Ups in Full Body

  { workout: workouts[3], exercise: exercises[8], sets: 3, reps: 60 }, # Plank (seconds) in Core Focus
  { workout: workouts[3], exercise: exercises[9], sets: 3, reps: 20 }, # Russian Twists in Core Focus

  { workout: workouts[4], exercise: exercises[4], sets: 3, reps: 15 }, # Push-Ups in Beginner
  { workout: workouts[4], exercise: exercises[6], sets: 3, reps: 12 }, # Bicep Curls in Beginner
  { workout: workouts[4], exercise: exercises[8], sets: 3, reps: 45 }, # Plank (seconds) in Beginner
]

# Insert records into WorkoutExercise join table
workout_exercises.each { |we| WorkoutExercise.create!(we) }

puts "✅ Seed data created successfully!"
