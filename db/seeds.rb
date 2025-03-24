# Clear existing data to prevent duplication
WorkoutExercise.destroy_all
Workout.destroy_all
Exercise.destroy_all
User.destroy_all
LikesWorkout.destroy_all

# Create random users
users = 5.times.map do
  User.create!(
    email: Faker::Internet.unique.email,
    password: 'securepassword',
    password_confirmation: 'securepassword'
  )
end

# Create exercises and associate each one with a random user
exercises = [
  { name: "Bench Press", description: "A classic upper body exercise that targets the chest, shoulders, and triceps." },
  { name: "Squats", description: "A fundamental lower body exercise working the quads, glutes, and hamstrings." },
  { name: "Deadlift", description: "A full-body strength movement primarily targeting the back, glutes, and hamstrings." },
  { name: "Pull-Ups", description: "An upper body exercise focusing on the back and biceps using bodyweight." },
  { name: "Push-Ups", description: "A versatile bodyweight exercise for building chest, shoulders, and triceps strength." },
  { name: "Lunges", description: "A unilateral lower body exercise improving balance and leg strength." },
  { name: "Bicep Curls", description: "An isolation exercise targeting the biceps for arm development." },
  { name: "Tricep Dips", description: "A bodyweight exercise to strengthen triceps and chest muscles." },
  { name: "Plank", description: "A core stability exercise that engages the abs, lower back, and shoulders." },
  { name: "Russian Twists", description: "A rotational core exercise that enhances oblique strength and balance." }
].map { |data| Exercise.create!(data.merge(user: users.sample)) }

# Create workouts and associate each workout with a random user
workouts = [
  "Upper Body Strength",
  "Lower Body Power",
  "Full Body Strength",
  "Core & Abs Focus",
  "Beginner Workout"
].map { |name| Workout.create!(name: name, user: users.sample) }

# Define workout exercises with sets and reps
workout_exercises = [
  { workout: workouts[0], exercise: exercises[0], sets: 4, reps: 8 },
  { workout: workouts[0], exercise: exercises[3], sets: 3, reps: 10 },
  { workout: workouts[0], exercise: exercises[6], sets: 3, reps: 12 },

  { workout: workouts[1], exercise: exercises[1], sets: 4, reps: 10 },
  { workout: workouts[1], exercise: exercises[5], sets: 3, reps: 12 },
  { workout: workouts[1], exercise: exercises[2], sets: 4, reps: 6 },

  { workout: workouts[2], exercise: exercises[0], sets: 4, reps: 8 },
  { workout: workouts[2], exercise: exercises[1], sets: 4, reps: 10 },
  { workout: workouts[2], exercise: exercises[2], sets: 3, reps: 6 },
  { workout: workouts[2], exercise: exercises[3], sets: 3, reps: 10 },
  { workout: workouts[2], exercise: exercises[4], sets: 3, reps: 15 },

  { workout: workouts[3], exercise: exercises[8], sets: 3, reps: 60 },
  { workout: workouts[3], exercise: exercises[9], sets: 3, reps: 20 },

  { workout: workouts[4], exercise: exercises[4], sets: 3, reps: 15 },
  { workout: workouts[4], exercise: exercises[6], sets: 3, reps: 12 },
  { workout: workouts[4], exercise: exercises[8], sets: 3, reps: 45 }
]

# Insert records into WorkoutExercise join table
workout_exercises.each { |we| WorkoutExercise.create!(we) }

# Create a test user with a workout
test_user = User.create!(
  email: 'mail@test.com',
  password: '12345678',
  password_confirmation: '12345678'
)

Workout.create!(name: "My Test Chest Exercise", user: test_user)

# Create Likes: each user should have at least 3 likes
users.each do |user|
  # Select 3 random workouts for each user
  random_workouts = workouts.sample(3)
  random_workouts.each do |workout|
    LikesWorkout.create!(user: user, workout: workout)
  end
end

# Hardcode likes for the test user
LikesWorkout.create!(user: test_user, workout: workouts[0]) # Upper Body Strength
LikesWorkout.create!(user: test_user, workout: workouts[2]) # Full Body Strength
LikesWorkout.create!(user: test_user, workout: workouts[4]) # Beginner Workout

puts "✅ Seed data created successfully!"
