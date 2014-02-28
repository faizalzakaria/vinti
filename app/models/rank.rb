
class Rank

  def self.get_ranking
    User.order("workout_distance DESC")
  end

end
