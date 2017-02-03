module V1
	class AssignmentsController < ApiController
		before_action :get_assignment, only:[:show,:upvote,:downvote]
		before_action :get_current_user,only:[:upvote,:downvote]
		skip_before_filter :verify_authenticity_token
		
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
					images[count] = aimage.image.url(:thumb)
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

		def upvote
			@assignment.upvote_by current_user
			render status: :ok, json:{
				votes: @assignment.cached_votes_up
			}
		end

		def downvote
			@assignment.downvote_by current_user
			render status: :ok, json:{
				votes: @assignment.cached_votes_up
			}
		end

		private

			def get_assignment
				@assignment = Assignment.find(params[:id])
			end

			def get_current_user
				current_user = User.find(params[:user_id])
			end
	end
end