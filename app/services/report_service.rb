class ReportService

	def self.generate_report_data(params, user)

		data = []

		if check_date(params)

			week_start = params[:week].to_date.beginning_of_week
			week_end = week_start + 6.days

			expenses = user.expenses.where("date >=  ? AND date <= ?", week_start, week_end)

			if expenses.any?
				data << "Expenses for period #{week_start} to #{week_end}: "
				data << "---------------------------------------------------------------"
				data << "\n"

				total_amount = 0
				average = 0

				expenses.each do |ex|
					data << "Expense description: #{ex.description}"
					data << "Expense amount: #{ex.amount}"
					data << "\n"
					total_amount += ex.amount
				end
				average = (total_amount / expenses.size).to_f

				data << "---------------------------------------------------------------"
				data << "Average: #{average}"
				data << "Total: #{total_amount}"
			else
				data << "There is no expenses for selected period #{week_start} to #{week_end}."
			end
		else
			data = nil
		end

		data
	end


	def self.generate_pdf(data)
		Prawn::Document.new do
			data.each do |el|
				text el.to_s
			end
		end.render
	end


	def self.check_date(params)
		if params[:week].present?
			begin
				Date.parse(params[:week])
				true
			rescue ArgumentError => e
				false
			end
		else
			false
		end
	end

end