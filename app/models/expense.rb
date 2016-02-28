class Expense < ActiveRecord::Base

	#attributes: description, amount, date, time, comment, user_id

	#associations
	belongs_to :user

	#validations
	validates :description, :amount, :date, :time, :comment, :user_id, :presence => true
	validates :amount, :numericality => true

end
