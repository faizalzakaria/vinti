class Admin::ChallengesController < Admin::BaseController

  def index
    @challenges = Challenge.all
    respond_to do |format|
      format.html
      format.json { render json: @challenges }
    end
  end

  def show
    @challenge = Challenge.find(params[:id])
    respond_to do |format|
      format.html
      format.json { render json: @challenge }
    end
  end

  def new
    @challenge = Challenge.new
    respond_to do |format|
      format.html
      format.json { render json: @challenge }
    end
  end

  def edit
    @challenge = Challenge.find(params[:id])
    respond_to do |format|
      format.html
      format.json { render json: @challenge }
    end
  end

  def create
    @challenge = Challenge.new(params[:challenge])
    respond_to do |format|
      if @challenge.save
        format.html { redirect_to admin_challenge_url(@challenge.id), notice: 'Challenge was successfully created.' }
        format.json { render json: @challenge, status: :created, location: @challenge }
      else
        flash.now[:alert] = @challenge.errors.full_messages.join(' ')
        format.html { render action: "new" }
        format.json { render json: @challenge.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @challenge = Challenge.find(params[:id])
    respond_to do |format|
      if @challenge.update_attributes(params[:challenge])
        format.html { redirect_to admin_challenge_url(@challenge.id), notice: 'Challenge was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @challenge.errors, status: :unprocessable_entity }
      end
    end

  end

  def destroy
    @challenge = Challenge.find(params[:id])
    @challenge.destroy

    respond_to do |format|
      format.html { redirect_to admin_challenges_url }
      format.json { head :no_content }
    end
  end

end
