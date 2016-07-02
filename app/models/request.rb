class Request < ActiveRecord::Base
	is_impressionable
	acts_as_votable
end
