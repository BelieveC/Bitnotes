class CollegesController < ApplicationController
	
	impressionist actions: [:show]
	before_action :get_college,only: [:show,:edit,:update,:destroy,:upvote]
	before_action :authenticate_user!,only:[:edit,:new,:create,:update,:destroy]

	def index
		@recentColleges = College.all.order("created_at desc").limit(3)
	end

	def show
		@recentColleges = College.all.order("created_at desc").limit(3)
		@recentSubjects = Subject.all.order("created_at desc").limit(3)
		@recentAssignments = Assignment.all.order("created_at desc").limit(3)
		@recentPracticals = Practical.all.order("created_at desc").limit(3)
		@recentQpapers = Qpaper.all.order("created_at desc").limit(3)
		@recentExamnotes = Examnote.all.order("created_at desc").limit(3)
	end

	def new
		@college = College.new
		render layout: "form"
	end

	def create
		@college = College.new(college_params)
		@college.user_id = current_user.id
		if @college.save
			redirect_to @college,notice:"Successfully created your College."
		else
			render layout: "form"
			render "new"
		end
	end

	def edit
		if session[:user_id] == @college.user_id
			render layout: "form"
		else
			redirect_to root_path,notice:"Gotcha!, You don't have access to edit this College."
		end
	end

	def update
		if session[:user_id] == @college.user_id
			if @college.update(college_params)
				redirect_to @college,notice:"Successfully updated your College"
			else
				render layout: "form"
				render "edit"
			end
		else
			redirect_to root_path,notice:"Gotcha!, You don't have access to edit this College."
		end
	end

	def destroy
		if session[:user_id] == @college.user_id
			@college.destroy
			redirect_to root_path,notice:"Successfully Destroyed your college"
		else
			redirect_to root_path,notice:"Gotcha! You don't have rights to destroy this College"
		end
	end

	def upvote
		@college.upvote_by current_user
		@flag = 0 unless current_user
		respond_to do |format|
			format.html{redirect_to :back}
			format.js
		end
	end

	private
		def get_college
			@college = College.find(params[:id])
		end

		def college_params
			params.require(:college).permit(:name,:address,cimages_attributes: [:id,:image,:_destroy])
		end
end
