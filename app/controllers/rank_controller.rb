class RankController < ApplicationController

  def index
    @challenges = Challenge.all
    respond_to do |format|
      format.html
      format.json { render jsong: @ranking }
    end
  end

end
