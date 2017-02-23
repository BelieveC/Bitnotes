module V1
	class AssignmentsController < ApiController
		before_action :get_assignment, only:[:show,:upvote,:downvote]
		before_action :get_current_user,only:[:upvote,:downvote]
		skip_before_filter :verify_authenticity_token
		
		def index
			@assignments = Assignment.recent.limit(12)
			render json: @assignments.as_json(include: { user: { only: [:phname] }, aimages: { methods: [:image_url], only: [] } }), status: :ok
		end


		def show
			render json: @assignment.as_json(include: { user: { only: [:phname] }, aimages: { methods: [:image_url], only: [] } }), status: :ok
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