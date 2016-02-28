class CreateExpenses < ActiveRecord::Migration
	def change
		create_table :expenses do |t|

			t.string :description
			t.float :amount
			t.date :date
			t.time :time
			t.string :comment
			t.integer :user_id, :references => :user


			t.timestamps null: false
		end
	end
end
