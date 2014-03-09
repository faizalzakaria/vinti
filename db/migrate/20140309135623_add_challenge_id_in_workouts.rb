class AddChallengeIdInWorkouts < ActiveRecord::Migration
  def up
    add_column :workouts, :challenge_id, :integer
  end

  def down
    remove_column :workouts, :challenge_id
  end
end
