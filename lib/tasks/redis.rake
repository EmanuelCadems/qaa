namespace :redis do
  desc 'Persist Redis in DB'
  task persist: :environment do
    Tenant.find_each do |tenant|
      request_counter = Rack::Attack
                        .cache
                        .store
                        .read("#{tenant.id}:request_counter:/v1/questions")

      tenant.update_column(:count_requests_backup, request_counter)
    end
  end

  desc 'Recover DB to Redis'
  task recover: :environment do
    STDOUT.puts "This task is destructive! Are you really sure that you want to override Redis with the backup in your DB? [y/N]"
    input = STDIN.gets.chomp
    raise "Aborting rake redis:recover. You entered #{input}" unless input.downcase == "y"
    progressbar = ProgressBar.create
    Tenant.find_each do |tenant|
      Rack::Attack.cache.store
        .set(
          "#{tenant.id}:request_counter:/v1/questions",
          tenant.count_requests_backup
        )
      progressbar.increment
    end
  end
end
