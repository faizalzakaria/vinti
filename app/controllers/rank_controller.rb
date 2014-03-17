class RankController < ApplicationController

  def index
    @challenges = Challenge.all(:order => "created_at DESC")
    @stars = User.order("workout_distance DESC")
    respond_to do |format|
      format.html
      format.json { render jsong: @ranking }
    end
  end

end
