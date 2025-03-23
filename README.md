# Gym Sessions App

This README provides instructions for setting up and running the Gym Sessions application.

## Ruby Version

- Ruby version: `3.4.2`

## System Dependencies

Run the following command to install the necessary dependencies:

- bundle install

## Database Setup

To set up the database, run the following commands:

1. **Database creation**:

- rails db:migrate

2. **Database initialization** (this will seed some initial data):

rails db:seed

The data for seeding was created with the help of ChatGPT.

## After Seeding

You can use the following credentials to log in:

- **Email**: `mail@test.com`
- **Password**: `12345678`

## Main Features of the Application

- Users can:
- Sign up, log in, and sign out.
- Create, edit, and delete exercises.
- Create, edit, and delete workouts.
- View workouts they have created.
- View all workouts and exercises.

## TODOs

- Create a feature to allow users to copy a workout:
- Users can create their own copy of a workout, invite others, change exercises, sets, reps, add people, and plan the workout for future sessions.

- Implement a new workout creation feature where users can:
- Select only their own exercises.

- Implement user profiles:
- Users can view other users' profiles and check out their workouts individually.
