class Practical < ActiveRecord::Base
	is_impressionable
	searchkick	
	acts_as_votable
	belongs_to :user
	belongs_to :college
	belongs_to :subject
	has_many :pimages
	accepts_nested_attributes_for :pimages, reject_if: :all_blank, allow_destroy: true

	scope :recent,->{all.order("created_at DESC")}

	validates :title, presence: true,length:{minimum: 5}
	validates :aim, presence: true,length:{minimum: 10}
	validates :college_id, presence: true
	validates :subject_id, presence: true
	validates :description, presence: true, length:{minimum: 20}
end
