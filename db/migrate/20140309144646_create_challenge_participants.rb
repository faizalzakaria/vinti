class CreateChallengeParticipants < ActiveRecord::Migration
  def change
    create_table :challenge_participants do |t|
      t.integer :challenge_id
      t.integer :participant_id
      t.decimal :total_distance, :precision => 10, :scale => 2, :default => 0.0, :null => false

      t.timestamps
    end
  end
end
