class Eimage < ActiveRecord::Base
	belongs_to :examnote
	
	validates :image, presence: true
  	has_attached_file :image,:styles => {:thumb => "1280*720>",:medium=>"640*426#",:small=>"180*320#"},
										  :convert_options => {
										    :thumb => "-quality 50 -strip",:medium=>"-quality 60 -strip",:small=>"-quality 60 -strip" }
  	validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end
