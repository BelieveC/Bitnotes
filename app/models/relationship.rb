class Relationship < ActiveRecord::Base

	belongs_to :subscribed, class_name: "User"
	belongs_to :subscriber, class_name: "User"

	validates :subscriber_id, presence: true
	validates :subscribed_id, presence: true
	
end
