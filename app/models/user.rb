class User < ActiveRecord::Base
	
	validates :avatar, presence: true
    has_attached_file :avatar,:styles => {:thumb => "1280*720>",:medium=>"640*426#",:small=>"180*320#"},
										  :convert_options => {
										    :thumb => "-quality 50 -strip",:medium=>"-quality 60 -strip",:small=>"-quality 90 -strip" }
    validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

	validates :cover, presence: true
    has_attached_file :cover,:styles => {:thumb => "1350*300#",:medium=>"640*426#",:small=>"180*320#"},
										  :convert_options => {
										    :thumb => "-quality 50 -strip",:medium=>"-quality 60 -strip",:small=>"-quality 90 -strip" }
    validates_attachment_content_type :cover, content_type: /\Aimage\/.*\Z/

	def self.from_omniauth(auth)
	    where(provider: auth.provider, uid: auth.uid).first_or_initialize.tap do |user|
	      user.provider = auth.provider
	      user.uid = auth.uid
	      user.name = auth.info.name
	      user.oauth_token = auth.credentials.token
	      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
	      user.save!
	    end
	end
end
