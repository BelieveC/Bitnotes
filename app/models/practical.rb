class Practical < ActiveRecord::Base
	is_impressionable
	acts_as_votable
	belongs_to :user
	belongs_to :college
	belongs_to :subject
	has_many :pimages
	accepts_nested_attributes_for :pimages, reject_if: :all_blank, allow_destroy: true
end
