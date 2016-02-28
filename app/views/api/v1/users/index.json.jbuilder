json.users @users do |u|
	json.user do
		json.id = u.id
		json.first_name = u.first_name
		json.last_name = u.last_name
		json.email = u.email
		json.role = u.role.name
	end
end