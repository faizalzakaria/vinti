class User < ActiveRecord::Base

  ####################################################################
  ## Extension
  ####################################################################
  rolify

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :omniauthable,
         :recoverable, :rememberable, :trackable, :validatable


  ####################################################################
  ## Attributes
  ####################################################################
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me
  attr_accessible :workout_distance, :provider, :uid


  ####################################################################
  ## Relations
  ####################################################################
  has_many :workouts, dependent: :destroy
  has_one  :profile, dependent: :destroy
  has_many :challenges, through: :workouts

  ####################################################################
  ## Callbacks
  ####################################################################
  after_create :create_profile

  ####################################################################
  ## Validations
  ####################################################################


  ####################################################################
  ## Implementations
  ####################################################################
  def update_workout
    workout_distance = workouts.inject(0) { |result, element| result + element.distance }
    self.update_attributes({:workout_distance => workout_distance})
    workout_distance
  end

  def self.find_for_facebook_oauth(auth, signed_in_resource=nil)
    user = User.where(:provider => auth.provider, :uid => auth.uid).first
    if user
      return user
    else
      registered_user = User.where(:email => auth.info.email).first
      if registered_user
        return registered_user
      else
        user = User.create(name:auth.extra.raw_info.name,
                    provider:auth.provider,
                    uid:auth.uid,
                    email:auth.info.email,
                    password:Devise.friendly_token[0,20],
                    )
      end
    end
  end

end
