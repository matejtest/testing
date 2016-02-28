class SamplesController < ApplicationController

	def index
		@samples = Sample.all.order('name')
	end


end