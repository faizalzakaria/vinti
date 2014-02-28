module Workout::FilterConcerns
  extend ActiveSupport::Concern

  included do

    def self.filter_by_user(user_id)
      return scoped if user_id.nil?
      where("user_id = ?", user_id)
    end
  end
end

