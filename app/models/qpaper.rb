class Qpaper < ActiveRecord::Base
	is_impressionable
	acts_as_votable
	belongs_to :user
	has_many :qimages
	accepts_nested_attributes_for :qimages, reject_if: :all_blank, allow_destroy: true
end
