module V1
	class AboutsController < ApiController

		def index
			@practicals = Practical.all.order("created_at DESC").limit(4)
			@assignments = Assignment.all.order("created_at DESC").limit(4)
			@qpapers = Qpaper.all.order("created_at DESC").limit(4)
			@examnotes = Examnote.all.order("created_at DESC").limit(4)

			count = 0
			assignmentimages = Array.new
			@assignments.each do |assignment|
				if assignment.aimages.count > 0
					assignmentimages[count] = assignment.aimages.first.image.url(:medium)
				else
					assignmentimages[count] = nil
				end
				count = count + 1
			end

			count = 0
			practicalimages = Array.new
			@practicals.each do |practical|
				if practical.pimages.count > 0
					practicalimages[count] = practical.pimages.first.image.url(:medium)
				else
					practicalimages[count] = nil
				end
				count = count + 1
			end

			count = 0
			examnoteimages = Array.new
			@examnotes.each do |examnote|
				if examnote.eimages.count > 0
					examnoteimages[count] = examnote.eimages.first.image.url(:medium)
				else
					examnoteimages[count] = nil
				end
				count = count + 1
			end

			count = 0
			qpaperimages = Array.new
			@qpapers.each do |qpaper|
				if qpaper.qimages.count > 0
					qpaperimages[count] = qpaper.qimages.first.image.url(:medium)
				else
					qpaperimages[count] = nil
				end
				count = count + 1
			end

			render status: :ok,json: {

				practicals: @practicals,
				practicalimages: practicalimages,
				assignments: @assignments,
				assignmentimages: assignmentimages,
				examnotes: @examnotes,
				examnoteimages: examnoteimages,
				qpapers: @qpapers,
				qpaperimages: qpaperimages

			}
		end

	end
end