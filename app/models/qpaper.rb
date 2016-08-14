class Qpaper < ActiveRecord::Base
	is_impressionable
	
	acts_as_votable
	belongs_to :user
	belongs_to :college
	belongs_to :subject
	has_many :qimages
	accepts_nested_attributes_for :qimages, reject_if: :all_blank, allow_destroy: true


	validates :examname, presence: true,length:{minimum: 5}
	validates :college_id, presence: true
	validates :subject_id, presence: true
	validates :date, presence: true
	validates :description, presence: true, length:{minimum: 20}
end
