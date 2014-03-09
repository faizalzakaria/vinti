namespace :migration do

  task :create_challenge => :environment do
    Rails.logger = Logger.new(Rails.root.join("log","migration_create_challenge.log"),5,5*1024*1024)

    params = {
      :title      => "Challenge week 1 of March",
      :start_date => DateTime.new(2014, 3, 1, 23, 59, 0, '+8'),
      :end_date   => DateTime.new(2014, 3, 8, 23, 59, 0, '+8')
    }
    challenge = Challenge.create!(params)
    p "#{challenge.start_date} #{challenge.end_date} #{challenge.created_at} created"

    Workout.find_in_batches do |group|
      group.each do |workout|
        next if workout.created_at > challenge.end_date
        Rails.logger.info("Save challenge for workout #{workout.id} to #{challenge.id}")
        workout.challenge_id = challenge.id
        workout.save
      end
    end
  end

end
