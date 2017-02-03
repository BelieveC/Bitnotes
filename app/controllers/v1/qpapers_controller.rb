module V1
	class QpapersController < ApiController
		before_action :get_qpaper, only:[:show,:upvote,:downvote]
		before_action :get_current_user,only:[:upvote,:downvote]
		skip_before_filter :verify_authenticity_token

		def index
			@qpapers = Qpaper.recent.limit(12)
			count = 0
			images = Array.new
			views = Array.new
			publications = Array.new
			@qpapers.each do |qpaper|
				views[count] = qpaper.impressionist_count
				publications[count] = qpaper.user.phname
				if qpaper.qimages.count > 0
					images[count] = qpaper.qimages.first.image.url(:medium)
				else
					images[count] = nil
				end
				count = count + 1
			end

			render status: :ok,json: {
				qpapers: @qpapers,
				images: images,
				publications: publications,
				views: views
			}
		end


		def show

			images = Array.new
			count = 0
			if @qpaper.qimages.count > 0
				@qpaper.qimages.each do |qimage|
					images[count] = qimage.image.url(:thumb)
					count = count + 1
				end
			else
				images[count] = nil
			end

			render status: :ok, json:{
				qpaper: @qpaper,
				publication: @qpaper.user.phname,
				views: @qpaper.impressionist_count,
				images: images
			}
		end

		def upvote
			@qpaper.upvote_by current_user
			render status: :ok, json:{
				votes: @qpaper.cached_votes_up
			}
		end

		def downvote
			@qpaper.downvote_by current_user
			render status: :ok, json:{
				votes: @qpaper.cached_votes_up
			}
		end

		private

			def get_qpaper
				@qpaper = Qpaper.find(params[:id])
			end

			def get_current_user
				current_user = User.find(params[:user_id])
			end
	end
end