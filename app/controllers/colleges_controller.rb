class CollegesController < ApplicationController
	
	impressionist actions: [:show]
	before_action :get_college,only: [:show,:edit,:update,:destroy,:upvote]

	def index
		@recentColleges = College.all.order("created_at desc").limit(3)
	end

	def show
	end

	def new
		@college = College.new
		render layout: "form"
	end

	def create
		@college = College.new(college_params)
		if @college.save
			redirect_to @college,notice:"Successfully Created Your College"
		else
			render layout: "form"
			render "new"
		end
	end

	def edit
		render layout: "form"
	end

	def update
		if @college.update(college_params)
			redirect_to @college,notice:"Successfully updated your College"
		else
			render layout: "form"
			render "edit"
		end
	end

	def destroy
		@college.destroy
		redirect_to root_path,notice:"Successfully Destroyed your college"
	end

	def upvote
		@college.upvote_by current_user
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
