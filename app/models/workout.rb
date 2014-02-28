class Workout < ActiveRecord::Base

  include Workout::FilterConcerns

  attr_accessible :workout_date, :distance

  belongs_to :user

  validates :workout_date, presence: true
  validates :distance, :numericality => { :greater_than => 0 }

end
