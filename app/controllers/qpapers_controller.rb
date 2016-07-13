class QpapersController < ApplicationController
	
	impressionist actions: [:show]
	before_action :get_qpaper,only: [:show,:edit,:update,:destroy,:upvote]
	before_action :authenticate_user!,only:[:edit,:new,:create,:update,:destroy]

	def index
		@recentQpapers = Qpaper.all.order("created_at desc").limit(3)
	end

	def show
		@recentAssignments = Assignment.all.order("created_at desc").limit(4)
		@recentPracticals = Practical.all.order("created_at desc").limit(4)
		@recentQpapers = Qpaper.all.order("created_at desc").limit(4)
		@recentExamnotes = Examnote.all.order("created_at desc").limit(4)
	end

	def new
		@qpaper = Qpaper.new
		render layout: "form"
	end

	def create
		@qpaper = Qpaper.new(qpaper_params)
		@qpaper.user_id = current_user.id
		if current_user.phname.empty?
			@qpaper.user_name = current_user.name 
		else
			@qpaper.user_name = current_user.phname
		end
		if @qpaper.save
			redirect_to @qpaper,notice:"Successfully created your Paper!"
		else
			render layout: "form"
			render "new"
		end
	end

	def edit
		if session[:user_id] == @qpaper.user_id
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
				render "edit"
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
		respond_to do |format|
			format.html{redirect_to :back}
			format.js
		end
	end

	private
		def get_qpaper
			@qpaper = Qpaper.find(params[:id])
		end

		def qpaper_params
			params.require(:qpaper).permit(:examname,:date,:description,:college_id,:subject_id,qimages_attributes: [:id,:image,:_destroy])
		end
end
