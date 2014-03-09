
class Challenge < ActiveRecord::Base
  module Ranking

    extend ActiveSupport::Concern

    included do

      def self.get_ranking
		
        #self.update_all_workout_total
        User.order("workout_distance DESC")
      end

    end
  end
end
