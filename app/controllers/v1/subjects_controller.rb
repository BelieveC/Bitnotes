module V1
	class SubjectsController < ApiController
		before_action :get_subject, only:[:show]

		def index
			@subjects = Subject.recent.limit(12)
			count = 0
			images = Array.new
			@subjects.each do |subject|
				if subject.simages.count > 0
					images[count] = subject.simages.first.image.url(:medium)
				else
					images[count] = nil
				end
				count = count + 1
			end

			render status: :ok,json: {
				subjects: @subjects,
				images: images
			}
		end


		def show

			images = Array.new
			count = 0
			if @subject.simages.count > 0
				@subject.simages.each do |simage|
					images[count] = simage.image.url(:medium)
					count = count + 1
				end
			else
				images[count] = nil
			end

			render status: :ok, json:{
				subject: @subject,
				images: images
			}
		end


		private

			def get_subject
				@subject = Subject.find(params[:id])
			end
	end
end