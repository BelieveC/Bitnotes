class UsersController < ApplicationController
  before_action :get_user, only:[:show,:edit,:update,:destroy]
  before_action :authenticate_user!,only:[:edit,:update,:destroy]
	def index
	end

	def show
		@recentUsers = User.all.order("created_at DESC").limit(5)
		@practicals =@user.practicals
		@qpapers = @user.qpapers
		@examnotes = @user.examnotes
		@assignments = @user.assignments
		@recentPracticals = @practicals.order("created_at DESC").limit(4)
		@recentQpapers =@qpapers.order("created_at DESC").limit(4)
		@recentExamnotes = @examnotes.order("created_at DESC").limit(4)
		@recentAssignments =@assignments.order("created_at DESC").limit(4)

		@totalvote = 0

		@practicals.each do |practical|
			@totalvote += practical.impressionist_count
		end
		@assignments.each do |assignment|
			@totalvote += assignment.impressionist_count
		end
		@qpapers.each do |qpaper|
			@totalvote += qpaper.impressionist_count
		end
		@examnotes.each do |examnote|
			@totalvote += examnote.impressionist_count
		end
		render layout: "form"
	end

	def new
	end

	def create
	end

	def edit
		if session[:user_id] == @user.id
			render layout: "form"
		else
			redirect_to root_path,notice:"Gotcha!,You are not owner of this Profile."
		end
	end

	def update
		if session[:user_id] == @user.id
			if @user.update(user_params)
				redirect_to @user,notice:"Profile Info Updated Successfully"
			else
				render "edit",layout: "form"
			end
		else
			redirect_to @user,notice:"Gotcha!, You are not Owner of this Profile"
		end
	end

	def destroy
		if session[:user_id] == @user.id
			@user.destroy
			redirect_to root_page,notice: "Your Publishing House Closed Successfully!"
		else
			redirect_to root_path,notice: "Gotcha!, You are not owner of this Profile"
		end
	end

	private
		def user_params
			params.require(:user).permit(:name,:phname,:intro,:description,:avatar,:cover,:googlelink,:fblink,:twitterlink,:pinterestlink)
		end

		def get_user
			@user = User.find(params[:id])
		end


end
