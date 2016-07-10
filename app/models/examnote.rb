class Examnote < ActiveRecord::Base
	is_impressionable
	acts_as_votable
	belongs_to :user
	has_many :eimages
	accepts_nested_attributes_for :eimages, reject_if: :all_blank, allow_destroy: true
end
