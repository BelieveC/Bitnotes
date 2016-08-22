class SubjectsController < ApplicationController
	
	impressionist actions: [:show]
	before_action :get_subject,only: [:show,:edit,:update,:destroy,:upvote,:downvote,:destroyimage]
	before_action :authenticate_user!,only:[:edit,:new,:create,:update,:destroy]

	def index
		@recentSubjects = Subject.all.order("created_at desc").limit(20)
	end

	def show
		@recentSubjects = Subject.all.order("created_at desc").limit(3)
		@recentColleges = College.all.order("created_at desc").limit(3)
		@recentAssignments = Assignment.all.order("created_at desc").limit(3)
		@recentPracticals = Practical.all.order("created_at desc").limit(3)
		@recentQpapers = Qpaper.all.order("created_at desc").limit(3)
		@recentExamnotes = Examnote.all.order("created_at desc").limit(3)
	end

	def new
		@subject = Subject.new
		render layout: "form"
	end

	def create
		@subject = Subject.new(subject_params)
		@subject.user_id = current_user.id
		if @subject.save
			redirect_to @subject,notice:"Successfully Created Your Subject"
		else
			render layout: "form",action:"new"
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

	private
		def get_subject
			@subject = Subject.find(params[:id])
		end

		def subject_params
			params.require(:subject).permit(:name,:description,:college_id,:subject_id,simages_attributes: [:id,:image,:_destroy])
		end
end
