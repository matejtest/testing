class Role < ActiveRecord::Base

	#attributes: name

	#associations
	has_many :users

	#validations
	validates :name, :presence => true

end
