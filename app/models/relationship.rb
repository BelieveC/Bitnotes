class Relationship < ActiveRecord::Base

	belongs_to :subscribed, class_name: "User"
	belongs_to :subscriber, class_name: "User"
end
