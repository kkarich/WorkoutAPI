class RemoveSetsFromPlanWorkouts < ActiveRecord::Migration
  def change
    remove_column :plan_workouts, :sets, :integer
  end
end
