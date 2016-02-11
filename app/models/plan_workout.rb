class PlanWorkout < ActiveRecord::Base
    belongs_to :plan
    has_many :workout_exercises
end
