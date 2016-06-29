class AssignmentsController < ApplicationController
	
	before_action :get_assignment,only: [:show,:edit,:update,:destroy,:upvote]

	def index
		@recentAssignments = Assignment.all.order("created_at desc").limit(3)
	end

	def show
		@recentAssignments = Assignment.all.order("created_at desc").limit(4)
		@recentPracticals = Practical.all.order("created_at desc").limit(4)
		@recentQpapers = Qpaper.all.order("created_at desc").limit(4)
		@recentExamnotes = Examnote.all.order("created_at desc").limit(4)
	end

	def new
		@assignment = Assignment.new
		render layout: "form"
	end

	def create
		@assignment = Assignment.new(assignment_params)
		if @assignment.save
			redirect_to @assignment,notice:"Created Your Assignment."
		else
			render layout: "form"
			render "new"
		end
	end

	def edit
		render layout: "form"
	end

	def update
		if @assignment.update(assignment_params)
			redirect_to @assignment,notice:"Updated your Assignment."
		else
			render layout: "form"
			render "edit"
		end
	end

	def destroy
		@assignment.destroy
		redirect_to root_path,notice:"Destroyed your Assignment."
	end

	def upvote
		@assignment.upvote_by current_user
		redirect_to :back
	end
	private
		def get_assignment
			@assignment = Assignment.find(params[:id])
		end

		def assignment_params
			params.require(:assignment).permit(:topic,:description,:college_id,:subject_id,aimages_attributes: [:id,:image,:_destroy])
		end
end
