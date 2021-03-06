class PracticalsController < ApplicationController

	impressionist actions: [:show]
	before_action :get_practical, only: [:show,:update,:edit,:destroy,:upvote,:downvote,:destroyimage]
	before_action :authenticate_user!,only:[:edit,:new,:create,:update,:destroy]

	def index
		@practicalpageindex = 1
		if current_user && current_user.college_id.present?
			@rpracticals = Practical.where(college_id: current_user.college_id).order("created_at DESC").limit(12)
			@recentPracticals = Practical.where.not(college_id: current_user.college_id).order("created_at DESC").limit(12)
		else
			@recentPracticals = Practical.recent.limit(12);
		end
	end

	def show
		@recentAssignments = Assignment.recent.limit(4)
		@recentPracticals = Practical.recent.limit(4)
		@recentQpapers = Qpaper.recent.limit(4)
		@recentExamnotes = Examnote.recent.limit(4)
	end

	def new
		@practical = Practical.new
		@subject = Subject.new
		@college = College.new
		render layout: "form"
	end

	def create
		@practical = Practical.new(practical_params)
		@practical.user_id = current_user.id

		respond_to do |format|
			if @practical.save
				fomat.html{redirect_to @practical,notice: "Successfully created your Practical!"}
				format.js
			else
				format.html {render layout:"form",action:"new"}
				format.js
			end
		end

		if @practical.save
			redirect_to @practical,notice: "Successfully created your Practical!"
		else
			render layout:"form",action:"new"
		end
	end

	def edit
		if session[:user_id] == @practical.user_id
			@check = 1
			render layout: "form"
		else
			redirect_to root_path,notice:"Gotcha!, You don't have access to edit this Practical."
		end
	end

	def update
		if session[:user_id] == @practical.user_id
			if @practical.update(practical_params)
				redirect_to @practical,notice: "Successfully Updated your Practical"
			else
				render action:"edit",layout:"form"
			end
		else
			redirect_to root_path,notice:"Gotcha!, You don't have access to edit this Practical."
		end
	end

	def destroy
		if session[:user_id] == @practical.user_id
			@practical.destroy
			redirect_to root_path,notice:"Successfully Removed your Practical"
		else
			redirect_to root_path,notice:"Gotcha!, You don't have right to delete this Practical"
		end
	end

	def upvote
		@practical.upvote_by current_user
		@flag = 0 unless current_user
		respond_to do |format|
			format.html{redirect_to :back}
			format.js
		end
	end

	def downvote
		@practical.downvote_by current_user
		@flag = 0 unless current_user
		respond_to do |format|
			format.html{redirect_to :back}
			format.js
		end
	end

	def destroyimage
		@pimage = @practical.pimages.find(params[:imageid])
		@pimage.destroy
		redirect_to :back
	end

	def loadmore
		@practicals = Practical.all.order("created_at DESC").paginate(page: params[:page],per_page: 4)
		@practicalpageindex = params[:page].to_i;
		respond_to do |format|
			format.html{redirect_to :back}
			format.js
		end
	end
	private
		/ Strong Params for Rails 4+  /
		def practical_params
			params.require(:practical).permit(:title,:aim,:description,:subject_id,:college_id,pimages_attributes: [:id,:image,:_destroy])
		end

		/ Get Practical for above action /
		def get_practical
			@practical = Practical.find(params[:id])
		end
end
