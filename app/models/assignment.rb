class Assignment < ActiveRecord::Base
	is_impressionable
	searchkick
	acts_as_votable
	has_many :aimages
	accepts_nested_attributes_for :aimages, reject_if: :all_blank, allow_destroy: true
end
