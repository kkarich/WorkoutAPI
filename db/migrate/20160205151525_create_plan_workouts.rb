class CreatePlanWorkouts < ActiveRecord::Migration
  def change
    create_table :plan_workouts do |t|
      t.references :plan, index: true, foreign_key: true
      t.string :name
      t.integer :order

      t.timestamps null: false
    end
  end
end
