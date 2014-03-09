class AddWorkoutCountIntoChallengeParticipants < ActiveRecord::Migration
  def up
    add_column :challenge_participants, :workout_count, :integer, default: 0
  end

  def down
    remove_column :challenge_participants, :workout_count
  end
end
