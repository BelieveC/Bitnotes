module V1
	class SubjectsController < ApiController
		before_action :get_subject, only:[:show,:upvote,:downvote]
		before_action :get_current_user,only:[:upvote,:downvote]
		skip_before_filter :verify_authenticity_token

		def index
			@subjects = Subject.recent.limit(12)
			render json: @subjects.as_json(include: { user: { only: [:phname] }, simages: { methods: [:image_url], only: [] } }), status: :ok
		end


		def show
			render json: @subject.as_json(include: { user: { only: [:phname] }, simages: { methods: [:image_url], only: [] } }), status: :ok
		end

		def upvote
			@subject.upvote_by current_user
			render status: :ok, json:{
				votes: @subject.cached_votes_up
			}
		end

		def downvote
			@subject.downvote_by current_user
			render status: :ok, json:{
				votes: @subject.cached_votes_up
			}
		end

		private

			def get_subject
				@subject = Subject.find(params[:id])
			end

			def get_current_user
				current_user = User.find(params[:user_id])
			end
	end
end