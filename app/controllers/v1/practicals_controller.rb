module V1
	class PracticalsController < ApiController
		before_action :get_practical, only:[:show]

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


		private

			def get_practical
				@practical = Practical.find(params[:id])
			end
	end
end