class PracticalsController < ApplicationController


	/ Before Performing below action Get Practical /
	before_action :get_practical, only: [:show,:update,:edit,:destroy]

	/ Index Page Action/
	def index
	end

	/ Show Page Action/
	def show
	end

	/ New Page Action/
	def new
		@practical = Practical.new
		render layout: "form"
	end

	/ Create Action /
	def create
		@practical = Practical.new(practical_params)
		if @practical.save
			redirect_to @practical,notice: "Successfully Created your Practical!"
		else
			render 'new'
		end
	end

	/ Edit Action /
	def edit
		render layout: "form"
	end

	/ Update Action /
	def update
		if @practical.update(practical_params)
			redirect_to @practical,notice: "Successfully Updated Your Practical"
		else
			render "edit"
		end
	end

	/ Destroy Action /
	def destroy
		@practical.destroy
		redirect_to root_path,notice:"Successfully Removed your Practical"
	end

	private
		/ Params for Rails 4+  /
		def practical_params
			params.require(:practical).permit(:title,:aim,:description,:subject_id,:college_id,pimages_attributes: [:id,:image,:_destroy])
		end

		/ Get Practical for above action /
		def get_practical
			@practical = Practical.find(params[:id])
		end
end
