class RelationshipsController < ApplicationController

	before_action :authenticate_user!

	def create
		user = User.find(params[:followed_id])
		current.user.subscribe(user)
		redirect_to :back
	end

	def destroy
		user = Relationship.find(params[:id]).followed
    	current_user.unfollow(user)
    	redirect_to user
	end

end

