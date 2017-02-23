module V1
	class ExamnotesController < ApiController
		before_action :get_examnote, only:[:show,:upvote,:downvote]
		before_action :get_current_user,only:[:upvote,:downvote]
		skip_before_filter :verify_authenticity_token

		def index
			@examnotes = Examnote.recent.limit(12)
			render json: @examnotes.as_json(include: { user: { only: [:phname] }, eimages: { methods: [:image_url], only: [] } }), status: :ok
		end


		def show
			render json: @examnote.as_json(include: { user: { only: [:phname] }, eimages: { methods: [:image_url], only: [] } }), status: :ok
		end

		def upvote
			@examnote.upvote_by current_user
			render status: :ok, json:{
				votes: @examnote.cached_votes_up
			}
		end

		def downvote
			@examnote.downvote_by current_user
			render status: :ok, json:{
				votes: @examnote.cached_votes_up
			}
		end

		private

			def get_examnote
				@examnote = Examnote.find(params[:id])
			end

			def get_current_user
				current_user = User.find(params[:user_id])
			end
	end
end