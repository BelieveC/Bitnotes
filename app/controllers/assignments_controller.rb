class AssignmentsController < ApplicationController
	
	impressionist actions: [:show]
	before_action :get_assignment,only: [:show,:edit,:update,:destroy,:upvote]
	before_action :authenticate_user!,only:[:edit,:new,:create,:update,:destroy]

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
		@assignment.user_id = current_user.id
		if current_user.phname.empty?
			@assignment.user_name = current_user.name 
		else
			@assignment.user_name = current_user.phname
		end
		if @assignment.save
			redirect_to @assignment,notice:"Successfully created your Assignment."
		else
			render layout: "form"
			render "new"
		end
	end

	def edit
		if session[:user_id] == @assignment.user_id
			render layout: "form"
		else
			redirect_to root_path,notice:"Gotcha!, You don't have access to edit this Assignment."
		end
	end

	def update
		if session[:user_id] = @assignment.user_id
			if @assignment.update(assignment_params)
				redirect_to @assignment,notice:"Successfully updated your Assignment."
			else
				render layout: "form"
				render "edit"
			end
		else
			redirect_to root_path,notice:"Gotcha!, You don't have access to update this Assignment."
		end
		
	end

	def destroy
		if session[:user_id] == @assignment.user_id
			@assignment.destroy
			redirect_to root_path,notice:"Destroyed your Assignment."
		else
			redirect_to root_path,notice:"Gotcha!, You don't have rights to Delete this Assignment"
		end
	end

	def upvote
		@assignment.upvote_by current_user
		respond_to do |format|
			format.html{redirect_to :back}
			format.js
		end
	end
	private
		def get_assignment
			@assignment = Assignment.find(params[:id])
		end

		def assignment_params
			params.require(:assignment).permit(:topic,:description,:college_id,:subject_id,aimages_attributes: [:id,:image,:_destroy])
		end
end
