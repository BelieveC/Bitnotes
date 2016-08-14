class Examnote < ActiveRecord::Base
	is_impressionable
	searchkick
	acts_as_votable
	belongs_to :user
	belongs_to :college
	belongs_to :subject
	has_many :eimages
	accepts_nested_attributes_for :eimages, reject_if: :all_blank, allow_destroy: true
end
