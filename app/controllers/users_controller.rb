class UsersController < ApplicationController
  before_action :get_user, only:[:show,:edit,:update,:destroy]

	def index
	end

	def show
		render layout: "form"
	end

	def new
	end

	def create
	end

	def edit
		render layout: "form"
	end

	def update
		if @user.update(user_params)
			redirect_to @user,notice:"Publishing House Info Updated Successfully"
		else
			render "edit",layout: "form"
		end
	end

	def destroy
		@user.destroy
		redirect_to root_page,notice: "Your Publishing House Closed Successfully!"
	end

	private
		def user_params
			params.require(:user).permit(:name,:phname,:intro,:description,:avatar,:cover)
		end

		def get_user
			@user = User.find(params[:id])
		end


end
