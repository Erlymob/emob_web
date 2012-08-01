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

	def profile_image
		response = HTTParty.get("https://api.twitter.com/1/users/profile_image?screen_name=#{params[:screen_name]}&size=original")
		if response.code == 200
			send_data response, :type => response.headers["content-type"], :disposition => 'inline'
		else
			redirect_to "/static/images/icons/no_profile.png"
		end
	end

end
