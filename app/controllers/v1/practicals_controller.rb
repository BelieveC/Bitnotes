module V1
	class PracticalsController < ApiController
		before_action :get_practical, only:[:show,:upvote,:downvote]
		before_action :get_current_user,only:[:upvote,:downvote]
		skip_before_filter :verify_authenticity_token

		def index
			@practicals = Practical.recent.limit(12)
			render json: @practicals.as_json( include: { user: { only: [:phname] }, pimages: { methods: [:image_url], only:[] } } ),status: :ok
		end


		def show
			render json: @practical.as_json( include: { user: { only: [:phname] }, pimages: { methods: [:image_url], only:[] } } ),status: :ok
		end

		def upvote
			@practical.upvote_by current_user
			render status: :ok, json:{
				votes: @practical.cached_votes_up
			}
		end

		def downvote
			@practical.downvote_by current_user
			render status: :ok, json:{
				votes: @practical.cached_votes_up
			}
		end

		private

			def get_practical
				@practical = Practical.find(params[:id])
			end

			def get_current_user
				current_user = User.find(params[:user_id])
			end
	end
end