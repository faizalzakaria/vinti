class Workout < ActiveRecord::Base

  ####################################################################
  ## Extensions
  ####################################################################
  include Workout::FilterConcerns

  ####################################################################
  ## Attributes
  ####################################################################
  attr_accessible :workout_date, :distance

  ####################################################################
  ## Relations
  ####################################################################
  belongs_to :user
  belongs_to :challenge

  ####################################################################
  ## Validations
  ####################################################################
  validates :workout_date, presence: true
  validates :distance, :numericality => { :greater_than => 0 }

  ####################################################################
  ## Callbacks
  ####################################################################
  after_save  :update_workout
  after_destroy :update_workout

  ####################################################################
  ## Implementations
  ####################################################################

  private

  def update_workout
    user.update_workout
    challenge.update_workout(user)
  end

end
