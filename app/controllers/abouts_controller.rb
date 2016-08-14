class AboutsController < ApplicationController
	def index
		if params[:search].blank?
			@practicals = Practical.all.order("created_at DESC").limit(3)
			@assignments = Assignment.all.order("created_at DESC").limit(4)
			@qpapers = Qpaper.all.order("created_at DESC").limit(4)
			@examnotes = Examnote.all.order("created_at DESC").limit(4)
		else
			@practicals = Practical.search(params[:search])
			@assignments = Assignment.search(params[:search])
			@examnotes = Examnote.all.limit(0)
			@qpapers = Qpaper.all.limit(0)
			@totalResult = @practicals.count + @assignments.count
			@query = params[:search]
		end
	end

	def privacy
		
	end

	def terms
	end

	def creators
		render layout: "form"
	end

	def copyright
	end

	def about
	end

	def try
		render layout: "form"
	end

	def language
		session[:langId] = params[:lang]
		redirect_to :back
	end

	def team
	end

	def result
		@practicals = Practical.search(params[:search])
		@assignments = Assignment.search(params[:search])
		@examnotes = Examnote.search(params[:search])
		@qpapers = Qpaper.search(params[:search])
		@colleges = College.search(params[:search])
		@subjects = Subject.search(params[:search])
		@users = User.search(params[:search])
		@totalResult = @practicals.count + @assignments.count + @examnotes.count+ @users.count + @qpapers.count + @colleges.count + @subjects.count
		@query = params[:search]
	end

end
