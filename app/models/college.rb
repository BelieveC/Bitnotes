class College < ActiveRecord::Base
	is_impressionable
	searchkick
	acts_as_votable
	has_many :assignments
	has_many :examnotes
	has_many :practicals
	has_many :qpapers
	belongs_to :user
	has_many :cimages
	accepts_nested_attributes_for :cimages, reject_if: :all_blank, allow_destroy: true

	validates :name, presence: true,length:{minimum: 5}
	validates :address, presence: true, length:{minimum: 10}
end
