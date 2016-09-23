namespace :user do
	desc "Pick first User"
	task :first => :environment do
		user = User.first
		puts "#{user.name}"
	end

	desc "Pick last User"
	task :last => :environment do
		user = User.last
		puts "#{user.name}"
	end

	desc "Total user count"
	task :count => :environment do
		count = User.all.count
		puts "#{count}"
	end

	task :all => [:first,:last,:count] 
end
	