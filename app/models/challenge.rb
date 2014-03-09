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
  has_many :challenge_participants
  has_many :participants, through: :challenge_participants, :class_name => "User", :foreign_key => "participant_id"

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

  def update_workout(user)
    ws = workouts.where('user_id = ?', user.id)
    cp = challenge_participants.where('participant_id = ?', user.id)
    if cp.empty?
      participants << user
      cp = challenge_participants.where('participant_id = ?', user.id)
    end
    cp = cp.first
    cp.total_distance = ws.inject(0) { |result, element| result + element.distance }
    cp.workout_count = ws.length
    cp.save!
  end

end
