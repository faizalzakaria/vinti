class Admin::LandingPagesController < Admin::BaseController

  def index
    @workouts = Workout.all
    respond_to do |format|
      format.html
      format.json { render json: @workouts }
    end
  end

end
