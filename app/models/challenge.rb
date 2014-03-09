class Challenge < ActiveRecord::Base

  ####################################################################
  ## Attributes
  ####################################################################
  attr_accessible :title, :rules, :start_date, :end_date

  ####################################################################
  ## Relations
  ####################################################################
  has_one  :winner, :class_name => "User", :foreign_key => "winner_id"
  has_many :workouts, dependent: :destroy
  has_many :users, through: :workouts

  ####################################################################
  ## Callbacks
  ####################################################################

  ####################################################################
  ## Validations
  ####################################################################
  validates :start_date, :end_date, :title, :presence => true
  validate :validate_end_date_before_start_date

  ####################################################################
  ## Implementations
  ####################################################################

  def validate_end_date_before_start_date
    if end_date && start_date
      errors.add(:end_date, "End date should be after start date") if end_date <= start_date
    end
  end

end
