class Qpaper < ActiveRecord::Base
	acts_as_votable
	has_many :qimages
	accepts_nested_attributes_for :qimages, reject_if: :all_blank, allow_destroy: true
end
