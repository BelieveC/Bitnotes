module V1
	class AboutsController < ApiController

		def index
			@practicals = Practical.all.order("created_at DESC").limit(4)
			@assignments = Assignment.all.order("created_at DESC").limit(4)
			@qpapers = Qpaper.all.order("created_at DESC").limit(4)
			@examnotes = Examnote.all.order("created_at DESC").limit(4)

			count = 0
			assignmentimages = Array.new
			assignmentviews = Array.new
			assignmentpublications = Array.new
			@assignments.each do |assignment|
				assignmentviews[count] = assignment.impressionist_count
				assignmentpublications[count] = assignment.user.phname
				if assignment.aimages.count > 0
					assignmentimages[count] = assignment.aimages.first.image.url(:medium)
				else
					assignmentimages[count] = nil
				end
				count = count + 1
			end

			count = 0
			practicalimages = Array.new
			practicalviews = Array.new
			practicalpublications = Array.new
			@practicals.each do |practical|
				practicalviews[count] = practical.impressionist_count
				practicalpublications[count] = practical.user.phname
				if practical.pimages.count > 0
					practicalimages[count] = practical.pimages.first.image.url(:medium)
				else
					practicalimages[count] = nil
				end
				count = count + 1
			end

			count = 0
			examnoteimages = Array.new
			examnoteviews = Array.new
			examnotepublications = Array.new
			@examnotes.each do |examnote|
				examnoteviews[count] = examnote.impressionist_count
				examnotepublications[count] = examnote.user.phname
				if examnote.eimages.count > 0
					examnoteimages[count] = examnote.eimages.first.image.url(:medium)
				else
					examnoteimages[count] = nil
				end
				count = count + 1
			end

			count = 0
			qpaperimages = Array.new
			qpaperviews = Array.new
			qpaperpublications = Array.new
			@qpapers.each do |qpaper|
				qpaperviews[count] = qpaper.impressionist_count
				qpaperpublications[count] = qpaper.user.phname
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
				practicalpublications: practicalpublications,
				practicalviews: practicalviews,
				assignments: @assignments,
				assignmentimages: assignmentimages,
				assignmentpublications: assignmentpublications,
				assignmentviews: assignmentviews,
				examnotes: @examnotes,
				examnoteimages: examnoteimages,
				examnotepublications: examnotepublications,
				examnoteviews: examnoteviews,
				qpapers: @qpapers,
				qpaperimages: qpaperimages,
				qpaperpublications: qpaperpublications,
				qpaperviews: qpaperviews

			}
		end


		def result

			@practicals = Practical.search(params[:search])
			@assignments = Assignment.search(params[:search])
			@examnotes = Examnote.search(params[:search])
			@qpapers = Qpaper.search(params[:search])
			@colleges = College.search(params[:search])
			@subjects = Subject.search(params[:search])


			count = 0
			assignmentimages = Array.new
			assignmentviews = Array.new
			assignmentpublications = Array.new
			@assignments.each do |assignment|
				assignmentviews[count] = assignment.impressionist_count
				assignmentpublications[count] = assignment.user.phname
				if assignment.aimages.count > 0
					assignmentimages[count] = assignment.aimages.first.image.url(:medium)
				else
					assignmentimages[count] = nil
				end
				count = count + 1
			end

			count = 0
			practicalimages = Array.new
			practicalviews = Array.new
			practicalpublications = Array.new
			@practicals.each do |practical|
				practicalviews[count] = practical.impressionist_count
				practicalpublications[count] = practical.user.phname
				if practical.pimages.count > 0
					practicalimages[count] = practical.pimages.first.image.url(:medium)
				else
					practicalimages[count] = nil
				end
				count = count + 1
			end

			count = 0
			examnoteimages = Array.new
			examnoteviews = Array.new
			examnotepublications = Array.new
			@examnotes.each do |examnote|
				examnoteviews[count] = examnote.impressionist_count
				examnotepublications[count] = examnote.user.phname
				if examnote.eimages.count > 0
					examnoteimages[count] = examnote.eimages.first.image.url(:medium)
				else
					examnoteimages[count] = nil
				end
				count = count + 1
			end

			count = 0
			qpaperimages = Array.new
			qpaperviews = Array.new
			qpaperpublications = Array.new
			@qpapers.each do |qpaper|
				qpaperviews[count] = qpaper.impressionist_count
				qpaperpublications[count] = qpaper.user.phname
				if qpaper.qimages.count > 0
					qpaperimages[count] = qpaper.qimages.first.image.url(:medium)
				else
					qpaperimages[count] = nil
				end
				count = count + 1
			end

			render json: {
				practicals: @practicals,
				practicalimages: practicalimages,
				practicalpublications: practicalpublications,
				practicalviews: practicalviews,
				assignments: @assignments,
				assignmentimages: assignmentimages,
				assignmentpublications: assignmentpublications,
				assignmentviews: assignmentviews,
				examnotes: @examnotes,
				examnoteimages: examnoteimages,
				examnotepublications: examnotepublications,
				examnoteviews: examnoteviews,
				qpapers: @qpapers,
				qpaperimages: qpaperimages,
				qpaperpublications: qpaperpublications,
				qpaperviews: qpaperviews,
				colleges: @colleges,
				subjects: @subjects 
			}
		end

	end

end