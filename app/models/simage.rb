class Simage < ActiveRecord::Base
	belongs_to :subject
	
	validates :image, presence: true
  	has_attached_file :image,:styles => {:thumb => "1280*720>",:medium=>"640*426#",:small=>"250*160#"},
										  :convert_options => {
										    :thumb => "-quality 50 -strip",:medium=>"-quality 60 -strip",:small=>"-quality 100 -strip" }
  	validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end
