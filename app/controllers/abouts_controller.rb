class AboutsController < ApplicationController
	def index 
		@practicalpageindex = 1
		@assignmentpageindex = 1
		@qpaperpageindex = 1
		@examnotepageindex = 1
		if current_user	&& current_user.college_id.present?
			@rpracticals = Practical.where(college_id: current_user.college_id).order("created_at DESC").limit(4)
			@rassignments = Assignment.where(college_id: current_user.college_id).order("created_at DESC").limit(4)
			@rqpapers = Qpaper.where(college_id: current_user.college_id).order("created_at DESC").limit(4)
			@rexamnotes = Examnote.where(college_id: current_user.college_id).order("created_at DESC").limit(4)
			@practicals = Practical.where.not(college_id: current_user.college_id).order("created_at DESC").limit(4)
			@assignments = Assignment.where.not(college_id: current_user.college_id).order("created_at DESC").limit(4)
			@qpapers = Qpaper.where.not(college_id: current_user.college_id).order("created_at DESC").limit(4)
			@examnotes = Examnote.where.not(college_id: current_user.college_id).order("created_at DESC").limit(4)
		else
			@practicals = Practical.all.order("created_at DESC").paginate(page: 1,per_page: 4)
			@assignments = Assignment.all.order("created_at DESC").paginate(page: 1,per_page: 4)
			@qpapers = Qpaper.all.order("created_at DESC").paginate(page: 1,per_page: 4)
			@examnotes = Examnote.all.order("created_at DESC").paginate(page: 1,per_page: 4)
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
