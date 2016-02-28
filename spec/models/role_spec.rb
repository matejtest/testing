require 'rails_helper'

RSpec.describe Role, type: :model do

	it "should validate presence of name" do
		role = Role.create(:name => '')
		role.valid?
		expect(role.errors).to have_key(:name)

		another_role = Role.create(:name => 'regular')
		another_role.valid?
		expect(another_role.errors.present?).to be false
	end

	it "should have one associated user record" do
		role = Role.create(:name => 'regular')
		user = User.create(:first_name => 'test', :last_name => 'test', :password => '000000', :password_confirmation => '000000', :role_id => role.id, :email => 'user@isp.net')

		expect(role).to respond_to(:users)
		expect(role.users.first.email).to eq "user@isp.net"
	end



end