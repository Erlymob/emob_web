class IndexController < ApplicationController

	def index
		if session[:access_token]
			@title = "Home"
			@mobs = HTTParty.get("#{Erlymob::Application.config.api_url}/mobs?token=#{session[:access_token]}")
			render "home"
		else
			render "landing_page"
		end
	end

end
