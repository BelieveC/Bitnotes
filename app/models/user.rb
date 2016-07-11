class User < ActiveRecord::Base

	has_many :active_relationships, class_name: "Relationship",
									foreign_key: "subscriber_id",
									dependent: :destroy
									
	has_many :subscribed, through: :active_relationships

	has_many :practicals
	has_many :assignments
	has_many :colleges
	has_many :examnotes
	has_many :qpapers
	has_many :subjects
	has_many :requests

    has_attached_file :avatar,:styles => {:thumb => "1280*720>",:medium=>"640*426#",:small=>"180*320#"},
										  :convert_options => {
										    :thumb => "-quality 50 -strip",:medium=>"-quality 60 -strip",:small=>"-quality 90 -strip" }
    validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

    has_attached_file :cover,:styles => {:thumb => "1350*300#",:medium=>"640*426#",:small=>"180*320#"},
										  :convert_options => {
										    :thumb => "-quality 50 -strip",:medium=>"-quality 60 -strip",:small=>"-quality 90 -strip" }
    validates_attachment_content_type :cover, content_type: /\Aimage\/.*\Z/

	def self.from_omniauth(auth)
	    where(provider: auth.provider, uid: auth.uid).first_or_initialize.tap do |user|
	      user.provider = auth.provider
	      user.uid = auth.uid
	      user.name = auth.info.name
	      user.phname = auth.info.name
	      user.oauth_token = auth.credentials.token
	      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
	      user.save!
	    end
	end
end
