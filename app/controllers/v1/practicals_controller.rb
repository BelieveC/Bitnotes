module V1
	class PracticalsController < ApiController
		before_action :get_practical, only:[:show]

		def index
			@practicals = Practical.all

			count = 0
			images = Array.new
			@practicals.each do |practical|
				if practical.pimages.count > 0
					images[count] = practical.pimages.first.image.url(:medium)
				else
					images[count] = nil
				end
				count = count + 1
			end

			render status: :ok,json: {
				practicals: @practicals,
				images: images
			}
		end


		def show

			images = Array.new
			count = 0
			if @practical.pimages.count > 0
				@practical.pimages.each do |pimage|
					images[count] = pimage.image.url(:medium)
					count = count + 1
				end
			else
				images[count] = nil
			end

			render status: :ok, json:{
				practical: @practical,
				images: images
			}
		end


		private

			def get_practical
				@practical = Practical.find(params[:id])
			end
	end
end