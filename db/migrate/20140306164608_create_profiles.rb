class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.integer :workouts_count
      t.decimal :total_distance,  :precision => 10, :scale => 2, :default => 0.0, :null => false
      t.integer :workouts_count_streak
      t.integer :viewed_count

      t.timestamps
    end
  end
end
