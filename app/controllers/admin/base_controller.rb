class Admin::BaseController < ApplicationController
  before_filter do
    authenticate_user!
    unless current_user.has_role?('admin')
      flash[:alert] = "Your are not Admin"
      redirect_to root_path
    end
  end

end

