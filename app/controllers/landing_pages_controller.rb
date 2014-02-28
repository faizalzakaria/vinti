class LandingPagesController < ApplicationController
  before_filter :authenticate_user!, :only => [:coming_soon]

  def index
  end

  def rules
  end

  def coming_soon
  end
end
