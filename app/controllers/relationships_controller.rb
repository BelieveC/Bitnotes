class RelationshipsController < ApplicationController

	before_action :authenticate_user!

	def create
		@user = User.find(params[:subscribed_id])
		current_user.active_relationships.create(subscribed_id: @user.id)
		respond_to do |format|
			format.html{redirect_to :back}
			format.js
		end
	end

	def destroy
		@user = Relationship.find(params[:id]).subscribed
    	current_user.active_relationships.find_by(subscribed_id: @user.id).destroy
    	respond_to do |format|
    		format.html{redirect_to :back}
    		format.js
    	end
	end

end

