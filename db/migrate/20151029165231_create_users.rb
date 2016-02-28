class CreateUsers < ActiveRecord::Migration
	def change
		create_table :users do |t|
			t.string :email
			t.string :first_name
			t.string :last_name
			t.string :password_digest
			t.integer :role_id, :references => :role, :default => 2
			t.string :auth_token
			t.string :api_token
			t.timestamps null: false
		end
	end
end
