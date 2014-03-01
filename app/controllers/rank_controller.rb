class RankController < ApplicationController

  def index
    @ranking = Rank.get_ranking
    respond_to do |format|
      format.html
      format.json { render jsong: @ranking }
    end
  end

end
