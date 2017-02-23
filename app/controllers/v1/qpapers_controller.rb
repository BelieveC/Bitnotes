module V1
	class QpapersController < ApiController
		before_action :get_qpaper, only:[:show,:upvote,:downvote]
		before_action :get_current_user,only:[:upvote,:downvote]
		skip_before_filter :verify_authenticity_token

		def index
			@qpapers = Qpaper.recent.limit(12)
			render json: @qpapers.as_json(include: { user: { only: [:phname] }, qimages: { methods: [:image_url], only: [] } }), status: :ok
		end


		def show
			render json: @qpaper.as_json(include: { user: { only: [:phname] }, qimages: { methods: [:image_url], only: [] } }), status: :ok
		end

		def upvote
			@qpaper.upvote_by current_user
			render status: :ok, json:{
				votes: @qpaper.cached_votes_up
			}
		end

		def downvote
			@qpaper.downvote_by current_user
			render status: :ok, json:{
				votes: @qpaper.cached_votes_up
			}
		end

		private

			def get_qpaper
				@qpaper = Qpaper.find(params[:id])
			end

			def get_current_user
				current_user = User.find(params[:user_id])
			end
	end
end