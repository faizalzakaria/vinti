class WorkoutsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :valid_user!, :except => [:index, :new, :create]

  def index
    @workouts = Workout.filter_by_user(current_user.id)
    respond_to do |format|
      format.html
      format.json { render json: @workouts }
    end
  end

  def show
    @workout = Workout.find(params[:id])
    respond_to do |format|
      format.html
      format.json { render json: @workout }
    end
  end

  def new
    @workout = Workout.new
    respond_to do |format|
      format.html
      format.json { render json: @workout }
    end
  end

  def edit
    @workout = Workout.find(params[:id])
    respond_to do |format|
      format.html
      format.json { render json: @workout }
    end
  end

  def create
    @workout = Workout.new(params[:workout])
    @workout.user_id = current_user.id
    raise Error if Challenge.find(Setting.first.current_challenge).nil?
    @workout.challenge_id = Setting.first.current_challenge
    # Current workout and set it
    respond_to do |format|
      if @workout.save
        format.html { redirect_to @workout, notice: 'Workout was successfully created.' }
        format.json { render json: @workout, status: :created, location: @workout }
      else
        flash.now[:alert] = @workout.errors.full_messages.join(' ')
        format.html { render action: "new" }
        format.json { render json: @workout.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @workout = Workout.find(params[:id])
    respond_to do |format|
      if @workout.update_attributes(params[:workout])
        format.html { redirect_to @workout, notice: 'Workout was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @workout.errors, status: :unprocessable_entity }
      end
    end

  end

  def destroy
    @workout = Workout.find(params[:id])
    @workout.destroy

    respond_to do |format|
      format.html { redirect_to workouts_url }
      format.json { head :no_content }
    end
  end

  private

  def valid_user!
    redirect_to root_path, alert: "Unathorized access" if current_user.id != Workout.find(params[:id]).user_id && !current_user.has_role?('admin')
  end

end
