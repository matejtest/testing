class ExpensesFilterService

	def self.get_filter_results(filter_id, user)
		case filter_id
		when "1"
			result = user.expenses.order('date DESC')
		when "2"
			result = user.expenses.where("date >= ? AND date < ?", Time.now.to_date() - 7.days, Time.now.to_date() ).order(:date)
		when "3"
			result = user.expenses.where("date >= ? AND date < ?", Time.now.to_date() - 1.month, Time.now.to_date() ).order(:date)
		when "4"
			result = user.expenses.where("amount < ?", 100).order(:amount)
		when "5"
			result = user.expenses.where("amount >= ?", 100).order(:amount)
		when "6"
			result = user.expenses.where("date = ?", Date.today()).order(:created_at)
		else
			result = nil
		end

		result
	end

end