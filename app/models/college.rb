class College < ActiveRecord::Base
	is_impressionable
	acts_as_votable
	belongs_to :user
	has_many :cimages
	accepts_nested_attributes_for :cimages, reject_if: :all_blank, allow_destroy: true
end
