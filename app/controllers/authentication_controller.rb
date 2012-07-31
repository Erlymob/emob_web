class AuthenticationController < ApplicationController

	def login
		response = HTTParty.get("#{Erlymob::Application.config.api_url}/get_request_token?callback_url=#{Erlymob::Application.config.web_url}/post_login")
		@request_token = response["result"]["token"]
		redirect_to "https://api.twitter.com/oauth/authenticate?oauth_token=#{@request_token}"
	end

	def post_login
		@oauth_token = params[:oauth_token]
		@oauth_verifier = params[:oauth_verifier]
		
		response = HTTParty.get("#{Erlymob::Application.config.api_url}/get_access_token?oauth_token=#{@oauth_token}&oauth_verifier=#{@oauth_verifier}")
		session[:access_token] = response["result"]["token"]
		session[:access_token_secret] = response["result"]["secret"]
		session[:user_id] = response["result"]["user_id"]
		session[:screen_name] = response["result"]["screen_name"]
		session[:api_url] = Erlymob::Application.config.api_url

		redirect_to home_path
	end

	def logout
		reset_session
		redirect_to home_path
	end

end
