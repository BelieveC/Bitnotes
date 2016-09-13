module ApplicationHelper
	 def title(page_title)
	    content_for :title , page_title.to_s
	 end

	 def keywords(keyword)
	 	content_for :keywords, keyword.to_s
	 end

	 def description(description)
	 	content_for :description, description.to_s
	 end

	 def author(author)
	 	content_for :author, author.to_s
	 end

	 def fbshareimage(fbshareimageurl)
	 	content_for :fbshareimageurl, fbshareimageurl.to_s
	 end

	 def fbshareurl(fbshareurl)
	 	content_for :fbshareurl, fbshareurl.to_s
	 end

	 def fbsharetitle(fbsharetitle)
	 	content_for :fbsharetitle,fbsharetitle.to_s
	 end
	 
end
