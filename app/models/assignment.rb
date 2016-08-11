class Assignment < ActiveRecord::Base
	is_impressionable
	acts_as_votable
	belongs_to :user
	belongs_to :college
	belongs_to :subject
	has_many :aimages
	accepts_nested_attributes_for :aimages, reject_if: :all_blank, allow_destroy: true
end
