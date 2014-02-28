
# Weekly rank
# Monthly rank
# Daily rank
# real time rank

class Rank

  # Todo optimize, update only when necessary
  def self.update_all_workout_total
    User.all.each do |user|
      user.workout_total
    end
  end

  def self.get_ranking
    self.update_all_workout_total
    User.order("workout_distance DESC")
  end

end
