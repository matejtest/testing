class User < ActiveRecord::Base

	#attributes: email, first_name, last_name, :password_digest, role_id, auth_token, api_token

	has_secure_password

	#associations
	belongs_to :role
	has_many :expenses, :dependent => :destroy

	#validations
	validates :first_name, :last_name, :email, :role_id, :presence => true
	validates :email, :uniqueness => true
	validates_formatting_of :email, :using => :email
	validates :password, :presence => true, :length => { :within => 4..15 }, :if => :validate_password?

	#callbacks
	before_create :init_user
	before_validation :do_before_save


	def reset_api_token
		self.api_token = SecureRandom.urlsafe_base64
		true
	end

	private

	def init_user
		self.auth_token = SecureRandom.urlsafe_base64
		self.api_token = SecureRandom.urlsafe_base64
		true
	end

	def do_before_save
		if self.email_changed?
			self.email.strip!
			self.email.downcase!
		end
	end

	def validate_password?
		@force_password_verification || new_record? || !password.blank?
	end
end
