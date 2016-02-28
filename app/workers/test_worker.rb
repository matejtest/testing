class TestWorker

	include Sidekiq::Worker

	require 'csv'
	require 'open-uri'

	def perform(file_url)

		csv_path = file_url
		csv_file = open(csv_path, 'r')
		csv_options = {
			chunk_size: 100
		}

		CSV.foreach(csv_file, headers: true) do |row|

			print "row"
			p row

			# sample = find_by_name(row["name"]) || new
			# sample.attributes = row.to_hash
			# #Sample.create! row.to_hash
			# sample.save!

			sample = Sample.find_by_name(row["Name"]) || Sample.new
			sample.update_attributes(

			   :transaction_date => row["Transaction_date"],
			   :product => row["Product"],
			   :price => row["Price"],
			   :payment_type => row["Payment_Type"],
			   :name => row["Name"],
			   :city => row["City"],
			   :state => row["State"],
			   :country => row["Country"],
			   :account_created => row["Account_Created"],
			   :last_login => row["Last_Login"],
			   :latitude => row["Latitude"],
			   :longitude => row["Longitude"]

			)
			sample.save!
		end


	end

end