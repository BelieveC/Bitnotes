namespace :views do
	desc "Update cache view counter with actual views"
	task :updatecache => :environment do
		puts "SitBack and Relax...."
		practicals = Practical.all
		practicals.each do |practical|
			practical.views = practical.impressionist_count
			practical.save
		end
		assignments = Assignment.all
		assignments.each do |assignment|
			assignment.views = assignment.impressionist_count
			assignment.save
		end
		examnotes = Examnote.all
		examnotes.each do |examnote|
			examnote.views = examnote.impressionist_count
			examnote.save
		end
		colleges = College.all
		colleges.each do |college|
			college.views = college.impressionist_count
			college.save
		end
		subjects = Subject.all
		subjects.each do |subject|
			subject.views = subject.impressionist_count
			subject.save
		end
		qpapers = Qpaper.all
		qpapers.each do |qpaper|
			qpaper.views = qpaper.impressionist_count
			qpaper.save
		end
		puts "Cheers Done!"
	end
end