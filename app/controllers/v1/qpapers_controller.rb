module V1
	class QpapersController < ApiController
		before_action :get_qpaper, only:[:show]

		def index
			@qpapers = Qpaper.recent.limit(12)
			count = 0
			images = Array.new
			@qpapers.each do |qpaper|
				if qpaper.qimages.count > 0
					images[count] = qpaper.qimages.first.image.url(:medium)
				else
					images[count] = nil
				end
				count = count + 1
			end

			render status: :ok,json: {
				qpapers: @qpapers,
				images: images
			}
		end


		def show

			images = Array.new
			count = 0
			if @qpaper.qimages.count > 0
				@qpaper.qimages.each do |qimage|
					images[count] = qimage.image.url(:medium)
					count = count + 1
				end
			else
				images[count] = nil
			end

			render status: :ok, json:{
				qpaper: @qpaper,
				images: images
			}
		end


		private

			def get_qpaper
				@qpaper = Qpaper.find(params[:id])
			end
	end
end