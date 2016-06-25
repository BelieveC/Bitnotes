class QpapersController < ApplicationController
	before_action :get_qpaper,only: [:show,:edit,:update,:destroy,:upvote]

	def index
		@recentQpapers = Qpaper.all.order("created_at desc").limit(3)
	end

	def show
	end

	def new
		@qpaper = Qpaper.new
		render layout: "form"
	end

	def create
		@qpaper = Qpaper.new(qpaper_params)
		if @qpaper.save
			redirect_to @qpaper,notice:"Successfully Created Your Qpaper!"
		else
			render layout: "form"
			render "new"
		end
	end

	def edit
		render layout: "form"
	end

	def update
		if @qpaper.update(qpaper_params)
			redirect_to @qpaper,notice:"Successfully updated your Qpaper"
		else
			render layout: "form"
			render "edit"
		end
	end

	def destroy
		@qpaper.destroy
		redirect_to root_path,notice:"Successfully Destroyed your Qpaper"
	end

	def upvote
		@qpaper.upvote_by current_user
		redirect_to :back
	end

	private
		def get_qpaper
			@qpaper = Qpaper.find(params[:id])
		end

		def qpaper_params
			params.require(:qpaper).permit(:examname,:date,:description,:college_id,:subject_id,qimages_attributes: [:id,:image,:_destroy])
		end
end
