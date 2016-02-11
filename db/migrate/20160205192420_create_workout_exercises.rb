class CreateWorkoutExercises < ActiveRecord::Migration
  def change
    create_table :workout_exercises do |t|
      t.references :plan_workout, index: true, foreign_key: true
      t.references :exercise, index: true, foreign_key: true
      t.integer :sets
      t.integer :reps
      t.integer :order

      t.timestamps null: false
    end
  end
end
