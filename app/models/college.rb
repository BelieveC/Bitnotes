class College < ActiveRecord::Base
	has_many :cimages
	accepts_nested_attributes_for :cimages, reject_if: :all_blank, allow_destroy: true
end
