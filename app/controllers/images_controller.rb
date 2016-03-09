class ImagesController < ApplicationController

	def index
		@images = Image.all
	end

	def new
	end

	def create
		image = Image.new
		image.image = params[:attachment]
		image.save!

		redirect_to images_path


	end


end