class AssignmentsController < ApplicationController
	
	before_action :get_assignment,only: [:show,:edit,:update,:destroy]

	def index
		@assignments = Assignment.all.order("created_at desc")
	end

	def show
	end

	def new
		@assignment = Assignment.new
		render layout: "form"
	end

	def create
		@assignment = Assignment.new(assignment_params)
		if @assignment.save
			redirect_to @assignment,notice:"Successfully Created Your Assignment"
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
			redirect_to @assignment,notice:"Successfully updated your assignment"
		else
			render layout: "form"
			render "edit"
		end
	end

	def destroy
		@assignment.destroy
		redirect_to root_path,notice:"Successfully Destroyed your Assignment"
	end


	private
		def get_assignment
			@assignment = Assignment.find(params[:id])
		end

		def assignment_params
			params.require(:assignment).permit(:topic,:description,:college_id,:subject_id)
		end
end
