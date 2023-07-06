class HomeController < ApplicationController
	def index
    render json: { test: 'OK' }, status: :ok
	end

end
