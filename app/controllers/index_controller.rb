class IndexController < ApplicationController

	def index
		if session[:access_token]
			@title = "Home"
			render :action => "home"
		else
			render :action => "landing_page"
		end
	end

	def landing_page
	end

	def home
	end

end
