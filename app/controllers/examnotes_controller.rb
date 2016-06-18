class ExamnotesController < ApplicationController
	before_action :get_examnote,only: [:show,:edit,:update,:destroy]

	def index
		@recentExamnotes = Examnote.all.order("created_at desc").limit(3)
	end

	def show
	end

	def new
		@examnote = Examnote.new
		render layout: "form"
	end

	def create
		@examnote = Examnote.new(examnote_params)
		if @examnote.save
			redirect_to @examnote,notice:"Successfully Created Your Examnote"
		else
			render layout: "form"
			render "new"
		end
	end

	def edit
		render layout: "form"
	end

	def update
		if @examnote.update(examnote_params)
			redirect_to @examnote,notice:"Successfully updated your Examnote"
		else
			render layout: "form"
			render "edit"
		end
	end

	def destroy
		@examnote.destroy
		redirect_to root_path,notice:"Successfully Destroyed your Examnote"
	end


	private
		def get_examnote
			@examnote = Examnote.find(params[:id])
		end

		def examnote_params
			params.require(:examnote).permit(:topic,:description,:college_id,:subject_id,eimages_attributes: [:id,:image,:_destroy])
		end
end
