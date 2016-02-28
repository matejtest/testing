class CreateSamples < ActiveRecord::Migration
  def change
    create_table :samples do |t|
      t.datetime :transaction_date
      t.string :product
      t.decimal :price
      t.string :payment_type
      t.string :name
      t.string :city
      t.string :state
      t.string :country
      t.datetime :account_created
      t.datetime :last_login
      t.string :latitude
      t.string :longitude

      t.timestamps null: false
    end
  end
end
