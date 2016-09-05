module V1
	class UsersController < ApiController
		before_action :get_user, only:[:show]

		def show

			images = Array.new
			
			if @user.avatar.present?
				images[0] = @user.avatar.url(:thumb)
			else
				images [0] = nil
			end

			if @user.cover.present?
				images[1] = @user.cover.url(:thumb)
			else
				images [1] = nil
			end

			render status: :ok, json:{
				user: @user,
				images: images
			}
		end


		private

			def get_user
				@user = User.find(params[:id])
			end
	end
end