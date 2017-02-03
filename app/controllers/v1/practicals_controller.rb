module V1
	class PracticalsController < ApiController
		before_action :get_practical, only:[:show,:upvote,:downvote]
		before_action :get_current_user,only:[:upvote,:downvote]
		skip_before_filter :verify_authenticity_token

		def index
			@practicals = Practical.recent.limit(12)
			count = 0
			images = Array.new
			views = Array.new
			publications = Array.new
			@practicals.each do |practical|
				views[count] = practical.impressionist_count
				publications[count] = practical.user.phname
				if practical.pimages.count > 0
					images[count] = practical.pimages.first.image.url(:medium)
				else
					images[count] = nil
				end
				count = count + 1
			end

			render status: :ok,json: {
				practicals: @practicals,
				images: images,
				publications: publications,
				views: views
			}
		end


		def show

			images = Array.new
			count = 0
			if @practical.pimages.count > 0
				@practical.pimages.each do |pimage|
					images[count] = pimage.image.url(:thumb)
					count = count + 1
				end
			else
				images[count] = nil
			end

			render status: :ok, json:{
				practical: @practical,
				publication: @practical.user.phname,
				views: @practical.impressionist_count,
				images: images
			}
		end

		def upvote
			@practical.upvote_by current_user
			render status: :ok, json:{
				votes: @practical.cached_votes_up
			}
		end

		def downvote
			@practical.downvote_by current_user
			render status: :ok, json:{
				votes: @practical.cached_votes_up
			}
		end

		private

			def get_practical
				@practical = Practical.find(params[:id])
			end

			def get_current_user
				current_user = User.find(params[:user_id])
			end
	end
end