class RequestsController < ApplicationController
	
	impressionist actions: [:show]
	before_action :get_request,only: [:show,:edit,:update,:destroy,:upvote]

	def index
		@recentRequests = Request.all.order("created_at desc").limit(3)
	end

	def show
	end

	def new
		@request = Request.new
		render layout: "form"
	end

	def create
		@request = Request.new(request_params)
		if @request.save
			redirect_to @request,notice:"Successfully Created Your Request"
		else
			render layout: "form"
			render "new"
		end
	end

	def edit
		render layout: "form"
	end

	def update
		if @request.update(request_params)
			redirect_to @request,notice:"Successfully updated your Request"
		else
			render layout: "form"
			render "edit"
		end
	end

	def destroy
		@request.destroy
		redirect_to root_path,notice:"Successfully Destroyed your Request"
	end

	def upvote
		@request.upvote_by current_user
		redirect_to :back
	end

	private
		def get_request
			@request = Request.find(params[:id])
		end

		def request_params
			params.require(:request).permit(:topic,:description,:college_id,:subject_id)
		end
end
