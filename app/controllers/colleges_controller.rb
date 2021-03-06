class CollegesController < ApplicationController
	
	impressionist actions: [:show]
	before_action :get_college,only: [:show,:edit,:update,:destroy,:upvote,:downvote,:destroyimage]
	before_action :authenticate_user!,only:[:edit,:new,:create,:update,:destroy]

	def index
		@collegepageindex = 1
		@recentColleges = College.recent.limit(20)
	end

	def show

		@recentColleges = College.recent.limit(3)
		@recentSubjects = Subject.recent.limit(3)
		@recentAssignments = Assignment.recent.limit(3)
		@recentPracticals = Practical.recent.limit(3)
		@recentQpapers = Qpaper.recent.limit(3)
		@recentExamnotes = Examnote.recent.limit(3)
		@collegepublications = User.where(college_id: @college.id).order("subscriber_count DESC").limit(16)

	end

	def new
		@college = College.new
		render layout: "form"
	end

	def create
		@college = College.new(college_params)
		@college.user_id = current_user.id
		respond_to do |format|
			if @college.save
				format.html{redirect_to @college,notice:"Successfully created your Institute."}
				format.js
			else
				format.html{render layout: "form",action: "new"}
				format.js
			end
		end
	end

	def edit
		if session[:user_id] == @college.user_id
			@check = 1
			render layout: "form"
		else
			redirect_to root_path,notice:"Gotcha!, You don't have access to edit this Institute."
		end
	end

	def update
		if session[:user_id] == @college.user_id
			if @college.update(college_params)
				redirect_to @college,notice:"Successfully updated your Institute"
			else
				render layout: "form",action:"edit"
				
			end
		else
			redirect_to root_path,notice:"Gotcha!, You don't have access to edit this Institute."
		end
	end

	def destroy
		if session[:user_id] == @college.user_id
			@college.destroy
			redirect_to root_path,notice:"Successfully Destroyed your college"
		else
			redirect_to root_path,notice:"Gotcha! You don't have rights to destroy this Institute"
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
	def downvote
		@college.downvote_by current_user
		@flag = 0 unless current_user
		respond_to do |format|
			format.html{redirect_to :back}
			format.js
		end
	end

	def destroyimage
		@cimage = @college.cimages.find(params[:imageid])
		@cimage.destroy
		redirect_to :back
	end

	def loadmore
		@colleges = College.all.order("created_at DESC").paginate(page: params[:page],per_page: 20)
		@collegepageindex = params[:page].to_i
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
