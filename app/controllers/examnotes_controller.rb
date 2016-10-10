class ExamnotesController < ApplicationController
	
	impressionist actions: [:show]
	before_action :get_examnote,only: [:show,:edit,:update,:destroy,:upvote,:downvote,:destroyimage]
	before_action :authenticate_user!,only:[:edit,:new,:create,:update,:destroy]

	def index
		if current_user && current_user.college_id.present?
			@rexamnotes = Examnote.where(college_id: current_user.college_id).order("created_at DESC").limit(12)
			@recentExamnotes = Examnote.where.not(college_id: current_user.college_id).order("created_at DESC").limit(12)
		else
			@recentExamnotes = Examnote.recent.limit(12)
		end
	end

	def show
		@recentAssignments = Assignment.recent.limit(4)
		@recentPracticals = Practical.recent.limit(4)
		@recentQpapers = Qpaper.recent.limit(4)
		@recentExamnotes = Examnote.recent.limit(4)
	end

	def new
		@examnote = Examnote.new
		render layout: "form"
	end

	def create
		@examnote = Examnote.new(examnote_params)
		@examnote.user_id = current_user.id
		if @examnote.save
			redirect_to @examnote,notice:"Successfully created your Note"
		else
			render layout: "form",action:"new"
		end
	end

	def edit
		if session[:user_id] == @examnote.user_id
			@check = 1
			render layout: "form"
		else
			redirect_to root_path,notice:"Sorry!, You don't have access to edit this Note."
		end
	end

	def update
		if session[:user_id] == @examnote.user_id
			if @examnote.update(examnote_params)
				redirect_to @examnote,notice:"Successfully updated your Note"
			else
				render layout: "form",action:"edit"
			end
		else
			redirect_to root_path,notice:"Sorry!, You don't have access to Update this Note."
		end
		
	end

	def destroy
		if session[:user_id] == @examnote.user_id
			@examnote.destroy
			redirect_to root_path,notice:"Successfully destroyed your Note"
		else
			redirect_to root_path,notice:"Sorry!, You don't have rights to Delete this Note."
		end
		
	end

	def upvote
		@examnote.upvote_by current_user
		@flag = 0 unless current_user
		respond_to do |format|
			format.html{redirect_to :back}
			format.js
		end
	end

	def downvote
		@examnote.downvote_by current_user
		@flag = 0 unless current_user
		respond_to do |format|
			format.html{redirect_to :back}
			format.js
		end
	end

	def destroyimage
		@eimage = @examnote.eimages.find(params[:imageid])
		@eimage.destroy
		redirect_to :back
	end

	def loadmore
		@examnotes = Examnote.all.order("created_at DESC").paginate(page: params[:page],per_page: 4)
		@examnotepageindex =  params[:page].to_i
		respond_to do |format|
			format.html {redirect_to :back}
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
