
namespace :users do
	desc "Initialization of the admin account."
	task :admin_init => :environment do

		role = Role.find_by_name("admin")

		user = User.new()
		user.first_name = "Big"
		user.last_name = "Boss"
		user.email = "admin@isp.net"
		user.auth_token = SecureRandom.urlsafe_base64
		user.api_token = SecureRandom.urlsafe_base64
		user.role_id = role.id
		user.password = "root"
		user.password_confirmation = "root"

		if user.save
			puts "Admin successfully initialized!"
		else
			puts "Error: #{user.errors.full_messages.to_sentence}"
		end
	end

end