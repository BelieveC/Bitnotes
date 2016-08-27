class QpapersController < ApplicationController
	
	impressionist actions: [:show]
	before_action :get_qpaper,only: [:show,:edit,:update,:destroy,:upvote,:downvote,:destroyimage]
	before_action :authenticate_user!,only:[:edit,:new,:create,:update,:destroy]

	def index
		if current_user && current_user.college_id.present?
			@rqpapers = Qpaper.where(college_id: current_user.college_id).order("created_at DESC").limit(12)
			@recentQpapers = Qpaper.where.not(college_id: current_user.college_id).order("created_at DESC").limit(12)
		else
			@recentQpapers = Qpaper.recent.limit(12);
		end
	end

	def show
		@recentAssignments = Assignment.recent.limit(4)
		@recentPracticals = Practical.recent.limit(4)
		@recentQpapers = Qpaper.recent.limit(4)
		@recentExamnotes = Examnote.recent.limit(4)
	end

	def new
		@qpaper = Qpaper.new
		render layout: "form"
	end

	def create
		@qpaper = Qpaper.new(qpaper_params)
		@qpaper.user_id = current_user.id
		if @qpaper.save
			redirect_to @qpaper,notice:"Successfully created your Paper!"
		else
			render layout: "form",action:"new"
		end
	end

	def edit
		if session[:user_id] == @qpaper.user_id
			@check = 1
			render layout: "form"
		else
			redirect_to root_path,notice:"Gotcha!, You don't have access to edit this Paper."
		end
	end

	def update
		if session[:user_id] == @qpaper.user_id
			if @qpaper.update(qpaper_params)
				redirect_to @qpaper,notice: "Successfully updated your Paper"
			else
				render layout:"form",action:"edit"
			end
		else
			redirect_to root_path,notice:"Gotcha!, You don't have access to edit this Paper."
		end
	end

	def destroy
		if session[:user_id] == @qpaper.user_id
			@qpaper.destroy
			redirect_to root_path,notice:"Successfully destroyed your Paper"
		else
			redirect_to root_path,notice:"Gotcha!, You don't have right to delete this Paper."
		end
	end

	def upvote
		@qpaper.upvote_by current_user
		@flag = 0 unless current_user
		respond_to do |format|
			format.html{redirect_to :back}
			format.js
		end
	end
	def downvote
		@qpaper.downvote_by current_user
		@flag = 0 unless current_user
		respond_to do |format|
			format.html{redirect_to :back}
			format.js
		end
	end

	def destroyimage
		@qimage = @qpaper.qimages.find(params[:imageid])
		@qimage.destroy
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
