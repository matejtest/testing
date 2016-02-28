class ApiConstraints

	def initialize(options)
		@version = options[:version]
		@default = options[:default]
	end

	def matches?(req)
		if req.headers && req.headers['ACCEPT']
			@default || req.headers['ACCEPT'].include?("application/vnd.expenses_tracker.v#{@version}")
		else
			@default
		end
	end
end