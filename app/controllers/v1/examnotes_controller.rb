module V1
	class ExamnotesController < ApiController
		before_action :get_examnote, only:[:show]

		def index
			@examnotes = Examnote.recent.limit(12)
			count = 0
			images = Array.new
			views = Array.new
			publications = Array.new

			@examnotes.each do |examnote|
				views[count] = examnote.impressionist_count
				publications[count] = examnote.user.phname
				if examnote.eimages.count > 0
					images[count] = examnote.eimages.first.image.url(:medium)
				else
					images[count] = nil
				end
				count = count + 1
			end

			render status: :ok,json: {
				examnotes: @examnotes,
				images: images,
				publications: publications,
				views: views
			}
		end


		def show

			images = Array.new
			count = 0
			if @examnote.eimages.count > 0
				@examnote.eimages.each do |eimage|
					images[count] = eimage.image.url(:thumb)
					count = count + 1
				end
			else
				images[count] = nil
			end

			render status: :ok, json:{
				examnote: @examnote,
				publication: @examnote.user.phname,
				views: @examnote.impressionist_count,
				images: images
			}
		end


		private

			def get_examnote
				@examnote = Examnote.find(params[:id])
			end
	end
end