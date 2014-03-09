class ChallengeParticipant < ActiveRecord::Base

  belongs_to :challenge
  belongs_to :participant, class_name: "User"
  attr_accessible :total_distance, :workout_count

end
