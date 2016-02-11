class RemoveRepsFromPlanWorkouts < ActiveRecord::Migration
  def change
    remove_column :plan_workouts, :reps, :integer
  end
end
