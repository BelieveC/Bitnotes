class College < ActiveRecord::Base
	searchkick
	acts_as_votable
	has_many :cimages
	accepts_nested_attributes_for :cimages, reject_if: :all_blank, allow_destroy: true
end
