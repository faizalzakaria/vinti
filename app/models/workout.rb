class Workout < ActiveRecord::Base

  include Workout::FilterConcerns

  attr_accessible :workout_date, :distance

  belongs_to :user

  validates :workout_date, presence: true
  validates :distance, :numericality => { :greater_than => 0 }

  after_save  :update_workout
  after_destroy :update_workout

  private

  def update_workout
    user.update_workout
  end

end
