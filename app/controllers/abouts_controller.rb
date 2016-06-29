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
			@qpapers = Qpaper.search(params[:search])
			@examnotes = Examnote.search(params[:search])
			@totalResult = @practicals.count + @assignments.count + @qpapers.count + @examnotes.count
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


end
