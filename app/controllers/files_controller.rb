class FilesController < ApplicationController

	def upload
	end


	def import_data
		puts "import_data"
		p params

		#Sample.import_data(params[:attachment])
		TestWorker.perform_in(10.seconds, 'http://samplecsvs.s3.amazonaws.com/SalesJan2009.csv')
		redirect_to samples_path()
	end


end
