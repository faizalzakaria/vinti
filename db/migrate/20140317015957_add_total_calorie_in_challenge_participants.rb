class AddTotalCalorieInChallengeParticipants < ActiveRecord::Migration
  def up
    add_column :challenge_participants, :total_calorie, :decimal, :precision => 10, :scale => 2, :default => 0.0, :null => false
  end

  def down
    remove_column :challenge_participants, :calorie
  end
end
