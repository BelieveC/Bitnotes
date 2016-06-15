class RequestsController < ApplicationController
	before_action :get_request,only: [:show,:edit,:update,:destroy]

	def index
		@requests = Request.all.order("created_at desc")
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


	private
		def get_request
			@request = Request.find(params[:id])
		end

		def request_params
			params.require(:request).permit(:topic,:description,:college_id,:subject_id)
		end
end
