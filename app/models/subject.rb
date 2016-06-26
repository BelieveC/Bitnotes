class Subject < ActiveRecord::Base
	searchkick
	acts_as_votable
	has_many :simages
	accepts_nested_attributes_for :simages, reject_if: :all_blank, allow_destroy: true
end
