class Sample < ActiveRecord::Base

	require 'csv'
	require 'open-uri'

	self.inheritance_column = :foo

	def self.import_data(file)

		csv_path = 'http://samplecsvs.s3.amazonaws.com/SalesJan2009.csv'
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

			sample = find_by_name(row["Name"]) || new
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


# # how to read and process a CSV that has to be accessed over HTTP using smarter_csv

# # I didn't have to specify this in my Rails setup, but you might
# require 'open-uri'

# # URL that points to where the CSV is hosted
# csv_path  = 'http://example.com/path/to/csv/file.csv'

# # open the CSV file using open-uri
# # you may have to specify encoding
# csv_file  = open(csv_path,'r')

# # whatever options (optional)
# csv_options = {
#   chunk_size: 100
# }

# # SmarterCSV can actually handle any object that responds to readline
# # I didn't see that in the docs and I had to look at the source, which is why I'm writing this gist
# SmarterCSV.process(csv_file, csv_options) do |chunk|
#   chunk.each do |row|
#     # do some stuff with row
#   end
# end
