class AddCalorieInWorkouts < ActiveRecord::Migration
  def up
    add_column :workouts, :calorie, :decimal, :precision => 10, :scale => 2, :default => 0.0, :null => false
  end

  def down
    remove_column :workouts, :calorie
  end
end
