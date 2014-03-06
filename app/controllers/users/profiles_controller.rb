class Users::ProfilesController < ApplicationController
  before_filter :authenticate_user!

  def index
    @user = User.find(params[:id])
    respond_to do |format|
      format.html
    end
  end

end
