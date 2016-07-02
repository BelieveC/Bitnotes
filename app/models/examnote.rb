class Examnote < ActiveRecord::Base
	is_impressionable
	searchkick
	acts_as_votable
	has_many :eimages
	accepts_nested_attributes_for :eimages, reject_if: :all_blank, allow_destroy: true
end
