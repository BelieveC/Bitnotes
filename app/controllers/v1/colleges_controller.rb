module V1
	class CollegesController < ApiController
		before_action :get_college, only:[:show,:upvote,:downvote]
		before_action :get_current_user,only:[:upvote,:downvote]
		skip_before_filter :verify_authenticity_token

		def index
			@colleges = College.recent.limit(12)
			count = 0
			images = Array.new
			views = Array.new
			publications = Array.new
			@colleges.each do |college|
				views[count] = college.impressionist_count
				publications[count] = college.user.phname
				if college.cimages.count > 0
					images[count] = college.cimages.first.image.url(:medium)
				else
					images[count] = nil
				end
				count = count + 1
			end

			render status: :ok,json: {
				colleges: @colleges,
				images: images,
				publications: publications,
				views: views
			}
		end


		def show

			images = Array.new
			count = 0
			if @college.cimages.count > 0
				@college.cimages.each do |cimage|
					images[count] = cimage.image.url(:thumb)
					count = count + 1
				end
			else
				images[count] = nil
			end

			render status: :ok, json:{
				college: @college,
				publication: @college.user.phname,
				views: @college.impressionist_count,
				images: images
			}
		end

		def upvote
			@college.upvote_by current_user
			render status: :ok, json:{
				votes: @college.cached_votes_up
			}
		end

		def downvote
			@college.downvote_by current_user
			render status: :ok, json:{
				votes: @college.cached_votes_up
			}
		end
		private

			def get_college
				@college = College.find(params[:id])
			end

			def get_current_user
				current_user = User.find(params[:user_id])
			end
	end
end