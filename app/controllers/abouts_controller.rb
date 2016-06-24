class AboutsController < ApplicationController
	def index
		@practicals = Practical.all.order("created_at DESC").limit(3)
		@assignments = Assignment.all.order("created_at DESC").limit(4)
		@qpapers = Qpaper.all.order("created_at DESC").limit(4)
		@examnotes = Examnote.all.order("created_at DESC").limit(4)
	end

	def test
	end

	def show
	end
end
