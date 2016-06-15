class Practical < ActiveRecord::Base
	has_many :pimages
	
	accepts_nested_attributes_for :pimages, reject_if: :all_blank, allow_destroy: true
end
