module V1
	class AssignmentsController < ApiController
		before_action :get_assignment, only:[:show]

		def index
			@assignments = Assignment.recent.limit(12)
			count = 0
			images = Array.new
			@assignments.each do |assignment|
				if assignment.aimages.count > 0
					images[count] = assignment.aimages.first.image.url(:medium)
				else
					images[count] = nil
				end
				count = count + 1
			end

			render status: :ok,json: {
				assignments: @assignments,
				images: images
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
				images: images
			}
		end


		private

			def get_assignment
				@assignment = Assignment.find(params[:id])
			end
	end
end