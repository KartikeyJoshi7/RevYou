class HomeController < ApplicationController
before_action :authenticate_user!

	def index
		return redirect_to '/uploads'
	end
end
