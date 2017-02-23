module V1
	class CollegesController < ApiController
		before_action :get_college, only:[:show,:upvote,:downvote]
		before_action :get_current_user,only:[:upvote,:downvote]
		skip_before_filter :verify_authenticity_token

		def index
			@colleges = College.recent.limit(12)
			render json: @colleges.as_json(include: { user: { only: [:phname] }, cimages: { methods: [:image_url], only: [] } }), status: :ok
		end


		def show
			render json: @college.as_json(include: { user: { only: [:phname] }, cimages: { methods: [:image_url], only: [] } }), status: :ok
		end

		def upvote
			@college.upvote_by current_user
			render status: :ok, json:{
				votes: @college.cached_votes_up
			}
		end

		def downvote
			@college.downvote_by current_user
			render status: :ok, json:{
				votes: @college.cached_votes_up
			}
		end
		private

			def get_college
				@college = College.find(params[:id])
			end

			def get_current_user
				current_user = User.find(params[:user_id])
			end
	end
end