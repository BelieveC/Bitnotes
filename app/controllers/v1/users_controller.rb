module V1
	class UsersController < ApiController
		before_action :get_user, only:[:show]
		skip_before_filter :verify_authenticity_token

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

		def user_oauth
			@user = User.where(uid: params[:uid]).first;
			if @user.present?
				render status: :ok, json:{
					id: @user.id
				}
			else
				@newUser = User.new(provider: "facebook",name: params[:name],uid: params[:uid],oauth_token: params[:oauth_token],oauth_expires_at: params[:oauth_expires_at],phname: params[:name],intro: "Welcome to my Publication",description: "Welcome to my Publication")
				if @newUser.save
					render status: :ok, json:{
						id: @newUser.id
					}
				else
					head 500
				end
			end	
		end

		private

			def get_user
				@user = User.find(params[:id])
			end

			def user_params
				params.require(:user).permit(:provider,:uid,:name,:oauth_token,:oauth_expires_at,:phname,:intro,:description)
			end
	end
end