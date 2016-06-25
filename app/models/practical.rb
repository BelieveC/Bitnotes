class Practical < ActiveRecord::Base
	acts_as_votable
	has_many :pimages
	accepts_nested_attributes_for :pimages, reject_if: :all_blank, allow_destroy: true
end
