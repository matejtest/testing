class Filter < ActiveRecord::Base
	#attributes: name

	#validations
	validates :name, :presence => true
end
