class Admin::SettingsController < Admin::BaseController

  def index
    @settings = Setting.all
    respond_to do |format|
      format.html
      format.json { render json: @settings }
    end
  end

  def show
    @setting = Setting.find(params[:id])
    respond_to do |format|
      format.html
      format.json { render json: @setting }
    end
  end

  def new
    @setting = Setting.new
    respond_to do |format|
      format.html
      format.json { render json: @setting }
    end
  end

  def edit
    @setting = Setting.find(params[:id])
    respond_to do |format|
      format.html
      format.json { render json: @setting }
    end
  end

  def create
    @setting = Setting.new(params[:setting])
    respond_to do |format|
      if @setting.save
        format.html { redirect_to admin_setting_url(@setting.id), notice: 'Setting was successfully created.' }
        format.json { render json: @setting, status: :created, location: @setting }
      else
        flash.now[:alert] = @setting.errors.full_messages.join(' ')
        format.html { render action: "new" }
        format.json { render json: @setting.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @setting = Setting.find(params[:id])
    respond_to do |format|
      if @setting.update_attributes(params[:setting])
        format.html { redirect_to admin_setting_url(@setting.id), notice: 'Setting was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @setting.errors, status: :unprocessable_entity }
      end
    end

  end

  def destroy
    @setting = Setting.find(params[:id])
    @setting.destroy

    respond_to do |format|
      format.html { redirect_to admin_settings_url }
      format.json { head :no_content }
    end
  end

end
