class SubjectsController < ApplicationController
	
	impressionist actions: [:show]
	before_action :get_subject,only: [:show,:edit,:update,:destroy,:upvote]

	def index
		@recentSubjects = Subject.all.order("created_at desc").limit(3)
	end

	def show
	end

	def new
		@subject = Subject.new
		render layout: "form"
	end

	def create
		@subject = Subject.new(subject_params)
		if @subject.save
			redirect_to @subject,notice:"Successfully Created Your Subject"
		else
			render layout: "form"
			render "new"
		end
	end

	def edit
		render layout: "form"
	end

	def update
		if @subject.update(subject_params)
			redirect_to @subject,notice:"Successfully updated your Subject"
		else
			render layout: "form"
			render "edit"
		end
	end

	def destroy
		@subject.destroy
		redirect_to root_path,notice:"Successfully Destroyed your Subject"
	end

	def upvote
		@subject.upvote_by current_user
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
