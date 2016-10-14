class SubjectsController < ApplicationController
	
	impressionist actions: [:show]
	before_action :get_subject,only: [:show,:edit,:update,:destroy,:upvote,:downvote,:destroyimage]
	before_action :authenticate_user!,only:[:edit,:new,:create,:update,:destroy]

	def index
		@subjectpageindex = 1
		@recentSubjects = Subject.recent.limit(20)
	end

	def show
		@recentSubjects = Subject.recent.limit(3)
		@recentColleges = College.recent.limit(3)
		@recentAssignments = Assignment.recent.limit(3)
		@recentPracticals = Practical.recent.limit(3)
		@recentQpapers = Qpaper.recent.limit(3)
		@recentExamnotes = Examnote.recent.limit(3)
	end

	def new
		@subject = Subject.new
		render layout: "form"
	end

	def create
		@subject = Subject.new(subject_params)
		@subject.user_id = current_user.id

		respond_to do |format|
			if @subject.save
				format.html{redirect_to @subject,notice:"Successfully Created Your Subject"}
				format.js
			else
				format.html{render layout: "form",action:"new"}
				format.js
			end
		end
		
	end

	def edit
		if session[:user_id] == @subject.user_id
			@check = 1
			render layout: "form"
		else
			redirect_to root_path,notice:"Gotcha!, You don't have access to edit this Subject."
		end
	end

	def update
		if session[:user_id] == @subject.user_id
			if @subject.update(subject_params)
				redirect_to @subject,notice: "Successfully Updated Your Subject"
			else
				render layout:"form",action:"edit"
			end
		else
			redirect_to root_path,notice:"Gotcha!, You don't have access to edit this Subject."
		end
	end

	def destroy
		if session[:user_id] == @subject.user_id
			@subject.destroy
			redirect_to root_path,notice:"Successfully Removed your subject"
		else
			redirect_to root_path,notice:"Gotcha!, You don't have right to delete this Subject"
		end
	end

	def upvote
		@subject.upvote_by current_user
		@flag = 0 unless current_user
		respond_to do |format|
			format.html{redirect_to :back}
			format.js
		end
	end
	def downvote
		@subject.downvote_by current_user
		@flag = 0 unless current_user
		respond_to do |format|
			format.html{redirect_to :back}
			format.js
		end
	end

	def destroyimage
		@simage = @subject.simages.find(params[:imageid])
		@simage.destroy
		redirect_to :back
	end

	def loadmore
		@subjects = Subject.all.order("created_at DESC").paginate(page: params[:page],per_page: 20)
		@subjectpageindex = params[:page].to_i
		respond_to do |format|
			format.html{redirect_to :back}
			format.js
		end
	end
	private
		def get_subject
			@subject = Subject.find(params[:id])
		end

		def subject_params
			params.require(:subject).permit(:name,:description,:college_id,:subject_id,simages_attributes: [:id,:image,:_destroy])
		end
end
