json.expenses @filter_result do |ex|
	json.expense do
		json.id ex.id
		json.description ex.description
		json.amount ex.amount
		json.date ex.date
		json.time ex.time.strftime("%H:%M")
		json.comment ex.comment
	end
end