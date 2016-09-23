namespace :subscriber do
	desc "Update every users subscriber count"
	task :updatecount => :environment do
		users = User.all
		users.each do |user|
			user.subscriber_count = user.subscriber.count
			user.save
		end
	end
end