class SessionService

	def self.login_params_valid?(params)

		if !params[:email].present? && !params[:password].present?
			return false
		end

		email = params[:email].downcase
		password = params[:password]

		if password.size < 4 || password.size > 15
			return false
		else
			email_regex = /^([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})$/i
			result = email_regex.match(email)
			return !result.nil?
		end
	end
end