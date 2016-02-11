class WorkoutExercise < ActiveRecord::Base
  belongs_to :exercise
  belongs_to :plan_workout
end
