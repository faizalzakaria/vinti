namespace :migration do

  task :create_profile => :environment do
    Rails.logger = Logger.new(Rails.root.join("log","migration_create_profile.log"),5,5*1024*1024)

    User.find_in_batches do |group|
      group.each do |user|
        user.profile.destroy if user.profile
        Rails.logger.info("Creating profile for #{user.name}")
        user.create_profile
      end
    end
  end

end

