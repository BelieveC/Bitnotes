class User < ActiveRecord::Base
	acts_as_voter
	searchkick
	# User Subscription setting

	has_many :active_relationships, class_name: "Relationship",
									foreign_key: "subscriber_id",
									dependent: :destroy

	has_many :passive_relationships, class_name: "Relationship",
									foreign_key: "subscribed_id",
									dependent: :destroy

	has_many :subscribed, through: :active_relationships
	has_many :subscriber, through: :passive_relationships
	
	# end

	has_many :practicals
	has_many :assignments
	has_many :colleges
	has_many :examnotes
	has_many :qpapers
	has_many :subjects
	has_many :requests
	has_many :notifications

	# Scopes
	scope :recent, ->{order("created_at DESC")}
	# Paperclip Config

    has_attached_file :avatar,:styles => {:thumb => "1280*720>",:medium=>"640*426#",:small=>"180*320"},
										  :convert_options => {
										    :thumb => "-quality 50 -strip",:medium=>"-quality 60 -strip",:small=>"-quality 90 -strip" }
    validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

    has_attached_file :cover,:styles => {:thumb => "1350*300#",:medium=>"640*426#",:small=>"180*320#"},
										  :convert_options => {
										    :thumb => "-quality 50 -strip",:medium=>"-quality 60 -strip",:small=>"-quality 20 -strip" }
    validates_attachment_content_type :cover, content_type: /\Aimage\/.*\Z/
    # Config End

    # Validations
    validates :phname, presence: true,length:{minimum: 5}
    validates :intro,presence: true,length:{minimum: 10}
    validates :description,presence: true,length:{minimum: 20}


    # Omniauth
	def self.from_omniauth(auth)
	    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
	      user.email = auth.info.email
	      user.provider = auth.provider
	      user.uid = auth.uid
	      user.name = auth.info.name
	      user.phname = auth.info.name
	      user.intro = "Welcome to my Publication"
	      user.description = "Welcome to my Publication"
	      user.oauth_token = auth.credentials.token
	      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
	      user.save!
	    end
	end
end
