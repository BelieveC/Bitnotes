class ExamnotesController < ApplicationController
	
	impressionist actions: [:show]
	before_action :get_examnote,only: [:show,:edit,:update,:destroy,:upvote]
	before_action :authenticate_user!,only:[:edit,:new,:create,:update,:destroy]

	def index
		@recentExamnotes = Examnote.all.order("created_at desc").limit(3)
	end

	def show
		@recentAssignments = Assignment.all.order("created_at desc").limit(4)
		@recentPracticals = Practical.all.order("created_at desc").limit(4)
		@recentQpapers = Qpaper.all.order("created_at desc").limit(4)
		@recentExamnotes = Examnote.all.order("created_at desc").limit(4)
	end

	def new
		@examnote = Examnote.new
		render layout: "form"
	end

	def create
		@examnote = Examnote.new(examnote_params)
		@examnote.user_id = current_user.id
		if current_user.phname.empty?
			@examnote.user_name = current_user.name 
		else
			@examnote.user_name = current_user.phname
		end
		if @examnote.save
			redirect_to @examnote,notice:"Successfully created your Examnote"
		else
			render layout: "form"
			render "new"
		end
	end

	def edit
		if session[:user_id] == @examnote.user_id
			render layout: "form"
		else
			redirect_to root_path,notice:"Sorry!, You don't have access to edit this Examnote."
		end
	end

	def update
		if session[:user_id] == @examnote.user_id
			if @examnote.update(examnote_params)
				redirect_to @examnote,notice:"Successfully updated your Examnote"
			else
				render layout: "form"
				render "edit"
			end
		else
			redirect_to root_path,notice:"Sorry!, You don't have access to Update this Examnote."
		end
		
	end

	def destroy
		if session[:user_id] == @examnote.user_id
			@examnote.destroy
			redirect_to root_path,notice:"Successfully destroyed your Examnote"
		else
			redirect_to root_path,notice:"Sorry!, You don't have rights to Delete this Examnote."
		end
		
	end

	def upvote
		@examnote.upvote_by current_user
		respond_to do |format|
			format.html{redirect_to :back}
			format.js
		end
	end

	private
		def get_examnote
			@examnote = Examnote.find(params[:id])
		end

		def examnote_params
			params.require(:examnote).permit(:topic,:description,:college_id,:subject_id,eimages_attributes: [:id,:image,:_destroy])
		end
end
