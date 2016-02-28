
json.expense do
	json.id @expense.id
	json.description @expense.description
	json.amount @expense.amount
	json.date @expense.date
	json.time @expense.time.strftime("%H:%M")
	json.comment @expense.comment
end

json.message "Expense successfully created."
json.success "true"