class SpamsController < ApplicationController
	def add
		@spam = Spam.where(["user_id = ? and post_id = ? and type_id = ?", "#{params[:user_id]}","#{params[:post_id]}","#{params[:type_id]}"]).first
		if @spam
			redirect_to :back,notice:"You have already marked it as Spam!"
			return
		end
		@spam = Spam.where(["post_id = ? and type_id = ?","#{params[:post_id]}","#{params[:type_id]}"]).first
		if @spam
			@spam.user_id = params[:user_id]
		else
			@spam = Spam.new
			@spam.type_id = params[:type_id]
			@spam.post_id = params[:post_id]
			@spam.user_id = params[:user_id]
		end
		@spam.count = @spam.count.to_i + 1
		@spam.save
		if @spam.count > 100
			if @spam.type_id == 1
				@prac = Practical.find(@spam.post_id)
				@prac.destroy
			elsif @spam.type_id == 2
				@examnote = Examnote.find(@spam.post_id)
				@examnote.destroy
			elsif @spam.type_id == 3
				@assignment = Assignment.find(@spam.post_id)
				@assignment.destroy
			elsif @spam.type_id == 4
				@paper = Qpaper.find(@spam.post_id)
				@paper.destroy
			elsif @spam.type_id == 5
				@college = College.find(@spam.post_id)
				@college.destroy
			elsif @spam.type_id == 6
				@subject = Subject.find(@spam.post_id)
				@subject.destroy
			else
				@request = Request.find(@spam.post_id)
				@request.destroy
			end
		end
		redirect_to :back,notice: "Thank You for Helping Us to Keep Our Site Clean! Our team would Look into Post and Your concern! And If User is found Guilty,Proper Action Would be Taken against User!"
	end
end
