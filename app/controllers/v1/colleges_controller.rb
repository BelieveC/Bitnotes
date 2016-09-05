module V1
	class CollegesController < ApiController
		before_action :get_college, only:[:show]

		def index
			@colleges = College.recent.limit(12)
			count = 0
			images = Array.new
			@colleges.each do |college|
				if college.cimages.count > 0
					images[count] = college.cimages.first.image.url(:medium)
				else
					images[count] = nil
				end
				count = count + 1
			end

			render status: :ok,json: {
				colleges: @colleges,
				images: images
			}
		end


		def show

			images = Array.new
			count = 0
			if @college.cimages.count > 0
				@college.cimages.each do |cimage|
					images[count] = cimage.image.url(:medium)
					count = count + 1
				end
			else
				images[count] = nil
			end

			render status: :ok, json:{
				college: @college,
				images: images
			}
		end


		private

			def get_college
				@college = College.find(params[:id])
			end
	end
end