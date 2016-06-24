class Qimage < ActiveRecord::Base

	belongs_to :qpaper

	validates :image, presence: true
  	has_attached_file :image,:styles => {:thumb => "1280*720" },
										  :convert_options => {
										    :thumb => "-quality 50 -strip" }
  	validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

end
