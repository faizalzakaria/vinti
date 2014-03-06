class Profile < ActiveRecord::Base
  attr_accessible :total_distance, :viewed_count, :workouts_count, :workouts_count_streak
  attr_accessible :quote

  belongs_to :user
end
