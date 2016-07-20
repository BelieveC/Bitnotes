class PracticalsController < ApplicationController

	impressionist actions: [:show]
	before_action :get_practical, only: [:show,:update,:edit,:destroy,:upvote]
	before_action :authenticate_user!,only:[:edit,:new,:create,:update,:destroy]

	def index
		@recentPracticals = Practical.all.order("created_at DESC").limit(3);
	end

	def show
		@recentAssignments = Assignment.all.order("created_at desc").limit(4)
		@recentPracticals = Practical.all.order("created_at desc").limit(4)
		@recentQpapers = Qpaper.all.order("created_at desc").limit(4)
		@recentExamnotes = Examnote.all.order("created_at desc").limit(4)
	end

	def new
		@practical = Practical.new
		render layout: "form"
	end

	def create
		@practical = Practical.new(practical_params)
		@practical.user_id = current_user.id
		if @practical.save
			redirect_to @practical,notice: "Successfully created your Practical!"
		else
			render 'new'
		end
	end

	def edit
		if session[:user_id] == @practical.user_id
			render layout: "form"
		else
			redirect_to root_path,notice:"Gotcha!, You don't have access to edit this Practical."
		end
	end

	def update
		if session[:user_id] == @practical.user_id
			if @practical.update(practical_params)
				redirect_to @practical,notice: "Successfully Updated your Practical"
			else
				render "edit"
			end
		else
			redirect_to root_path,notice:"Gotcha!, You don't have access to edit this Practical."
		end
	end

	def destroy
		if session[:user_id] == @practical.user_id
			@practical.destroy
			redirect_to root_path,notice:"Successfully Removed your Practical"
		else
			redirect_to root_path,notice:"Gotcha!, You don't have right to delete this Practical"
		end
	end

	def upvote
		@practical.upvote_by current_user
		respond_to do |format|
			format.html{redirect_to :back}
			format.js
		end
	end

	private
		/ Strong Params for Rails 4+  /
		def practical_params
			params.require(:practical).permit(:title,:aim,:description,:subject_id,:college_id,pimages_attributes: [:id,:image,:_destroy])
		end

		/ Get Practical for above action /
		def get_practical
			@practical = Practical.find(params[:id])
		end
end
