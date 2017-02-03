module V1
	class SubjectsController < ApiController
		before_action :get_subject, only:[:show,:upvote,:downvote]
		before_action :get_current_user,only:[:upvote,:downvote]
		skip_before_filter :verify_authenticity_token

		def index
			@subjects = Subject.recent.limit(12)
			count = 0
			images = Array.new
			views = Array.new
			publications = Array.new
			@subjects.each do |subject|
				views[count] = subject.impressionist_count
				publications[count] = subject.user.phname
				if subject.simages.count > 0
					images[count] = subject.simages.first.image.url(:medium)
				else
					images[count] = nil
				end
				count = count + 1
			end

			render status: :ok,json: {
				subjects: @subjects,
				images: images,
				publications: publications,
				views: views
			}
		end


		def show

			images = Array.new
			count = 0
			if @subject.simages.count > 0
				@subject.simages.each do |simage|
					images[count] = simage.image.url(:thumb)
					count = count + 1
				end
			else
				images[count] = nil
			end

			render status: :ok, json:{
				subject: @subject,
				publication: @subject.user.phname,
				views: @subject.impressionist_count,
				images: images
			}
		end

		def upvote
			@subject.upvote_by current_user
			render status: :ok, json:{
				votes: @subject.cached_votes_up
			}
		end

		def downvote
			@subject.downvote_by current_user
			render status: :ok, json:{
				votes: @subject.cached_votes_up
			}
		end

		private

			def get_subject
				@subject = Subject.find(params[:id])
			end

			def get_current_user
				current_user = User.find(params[:user_id])
			end
	end
end