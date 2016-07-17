class Subject < ActiveRecord::Base
	is_impressionable
	acts_as_votable
	belongs_to :user
	has_many :assignments
	has_many :examnotes
	has_many :practicals
	has_many :qpapers
	has_many :simages
	accepts_nested_attributes_for :simages, reject_if: :all_blank, allow_destroy: true
end
