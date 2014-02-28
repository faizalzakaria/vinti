class CreateWorkouts < ActiveRecord::Migration
  def change
    create_table :workouts do |t|
      t.datetime :workout_date
      t.decimal :distance, :precision => 10, :scale => 2, :default => 0.0, :null => false
      t.integer :user_id
      t.timestamps
    end
  end
end
