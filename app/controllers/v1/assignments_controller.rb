module V1
	class AssignmentsController < ApiController
		before_action :get_assignment, only:[:show]

		def index
			@assignments = Assignment.recent.limit(12)
			count = 0
			images = Array.new
			views = Array.new
			publications = Array.new
			@assignments.each do |assignment|
				views[count] = assignment.impressionist_count
				publications[count] = assignment.user.phname
				if assignment.aimages.count > 0
					images[count] = assignment.aimages.first.image.url(:medium)
				else
					images[count] = nil
				end
				count = count + 1
			end

			render status: :ok,json: {
				assignments: @assignments,
				images: images,
				publications: publications,
				views: views
			}
		end


		def show

			images = Array.new
			count = 0
			if @assignment.aimages.count > 0
				@assignment.aimages.each do |aimage|
					images[count] = aimage.image.url(:medium)
					count = count + 1
				end
			else
				images[count] = nil
			end

			render status: :ok, json:{
				assignment: @assignment,
				publication: @assignment.user.phname,
				views: @assignment.impressionist_count,
				images: images
			}
		end


		private

			def get_assignment
				@assignment = Assignment.find(params[:id])
			end
	end
end