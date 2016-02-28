json.user do
	json.id @user.id
	json.name @user.first_name
	json.last_name @user.last_name
	json.email @user.email
	json.role @user.role.name
	json.api_token @user.api_token
end

json.message "User successfully updated."
json.success "true"