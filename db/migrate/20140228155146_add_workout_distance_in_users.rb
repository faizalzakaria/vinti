class AddWorkoutDistanceInUsers < ActiveRecord::Migration
  def up
    add_column :users, :workout_distance, :decimal, :precision => 10, :scale => 2, :default => 0.0, :null => false
  end

  def down
    remove_column :users, :workout_distance
  end
end
