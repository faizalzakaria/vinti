class SetDefaultValuesForProfiles < ActiveRecord::Migration
  def up
    change_column :profiles, :workouts_count, :integer, :default => 0
    change_column :profiles, :workouts_count_streak, :integer, :default => 0
    change_column :profiles, :viewed_count, :integer, :default => 0
    change_column :profiles, :quote, :string, :default => "Run like channing tatum is waiting for you at the finish line", :limit => 255
  end

  def down
  end
end
