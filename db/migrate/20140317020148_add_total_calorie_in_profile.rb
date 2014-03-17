class AddTotalCalorieInProfile < ActiveRecord::Migration
  def up
    add_column :profiles, :total_calorie, :decimal, :precision => 10, :scale => 2, :default => 0.0, :null => false
  end

  def down
    remove_column :profiles, :total_calorie
  end
end
