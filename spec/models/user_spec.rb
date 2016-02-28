require 'rails_helper'

RSpec.describe User, type: :model do


	it "should validate presence of first_name" do
		user = User.create(:first_name => '')
		user.valid?
		expect(user.errors).to have_key(:first_name)
	end

	it "should validate presence of last_name" do
		user = User.create(:last_name => '')
		user.valid?
		expect(user.errors).to have_key(:last_name)
	end

	it "should validate presence of email" do
		user = User.create(:email => nil)
		user.valid?
		expect(user.errors).to have_key(:email)
	end

	# it "should validate presence of role" do
	# 	user = FactoryGirl.build(:regular_user, :role_id => '')
	# 	user.valid?
	# 	expect(user.errors).to have_key(:role_id)
	# end

	# it "should validate uniqueness of email" do
	# 	regular_user = FactoryGirl.create(:regular_user)
	# 	admin_user = FactoryGirl.build(:admin_user, :email => regular_user.email)
	# 	admin_user.valid?
	# 	expect(admin_user.errors).to have_key(:email)
	# end

	# it "should validate formatting of email" do
	# 	user = FactoryGirl.build(:regular_user, :email => 'blabla')
	# 	user.valid?
	# 	expect(user.errors).to have_key(:email)
	# end

	# it "should validate formatting of email" do
	# 	user = FactoryGirl.build(:regular_user, :email => 'someone@isp.net')
	# 	user.valid?
	# 	expect(user.errors.present?).to be false
	# end

	# it "should validate presence of password" do
	# 	user = FactoryGirl.build(:regular_user, :password => '')
	# 	user.valid?
	# 	expect(user.errors).to have_key(:password)
	# end

	# it "should validate confirmation of password" do
	# 	user = FactoryGirl.build(:regular_user, :password => '1234', :password_confirmation => '4321')
	# 	user.valid?
	# 	expect(user.errors).to have_key(:password_confirmation)
	# end

	# it "should validate length of password" do
	# 	user = FactoryGirl.build(:regular_user, :password => '123')
	# 	user.valid?
	# 	expect(user.errors).to have_key(:password)
	# end

	# it "should validate length of password" do
	# 	user = FactoryGirl.build(:regular_user, :password => '1234567891abcedf')
	# 	user.valid?
	# 	expect(user.errors).to have_key(:password)
	# end

	# it "user should belong to role" do
	# 	role = FactoryGirl.create(:regular_role)
	# 	user = FactoryGirl.create(:regular_user, :role_id => role.id)
	# 	expect(user).to respond_to(:role)
	# 	expect(user.role.name).to eq "regular"
	# end

	# it "user should have one associated expense" do
	# 	role = FactoryGirl.create(:regular_role)
	# 	user = FactoryGirl.create(:regular_user, :role_id => role.id)
	# 	expense = FactoryGirl.create(:expense, :user_id => user.id)

	# 	expect(user).to respond_to(:expenses)
	# 	expect(user.expenses.first.description).to eq "some description"
	# end


end