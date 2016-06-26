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
		end

	end

	def test
	end

	def show
	end
end
