class Api::V1::FiltersController < Api::V1::ApplicationController
	def index
		@filters = Filter.all
		authorize @filters.first
		render 'index.json.jbuilder', :status => 200
	end
end
