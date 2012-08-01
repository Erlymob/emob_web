class MobController < ApplicationController

	def like
		response = HTTParty.post("#{Erlymob::Application.config.api_url}/like", :body => {
			:token => session[:access_token],
			:id => params[:id],
			:like => true
		})
		render :json => response
	end

	def unlike
		response = HTTParty.post("#{Erlymob::Application.config.api_url}/like", :body => {
			:token => session[:access_token],
			:id => params[:id],
			:like => false
		})
		render :json => response
	end

	def rsvp
		response = HTTParty.post("#{Erlymob::Application.config.api_url}/rsvp", :body => {
			:token => session[:access_token],
			:id => params[:id],
			:going => true
		})
		puts response.inspect
		render :json => response
	end

	def unrsvp
		response = HTTParty.post("#{Erlymob::Application.config.api_url}/rsvp", :body => {
			:token => session[:access_token],
			:id => params[:id],
			:going => false
		})
		render :json => response
	end

end
