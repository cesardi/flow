class ApplicationController < ActionController::Base
	# Prevent CSRF attacks by raising an exception.
	# For APIs, you may want to use :null_session instead.
	protect_from_forgery with: :exception
	include SessionsHelper

	before_filter :require_login

	protected

	# Shared before filters

	# Confirms a logged-in user.
	def logged_in_user
		unless logged_in?
			store_location
			flash[:danger] = 'Please log in!'
			redirect_to login_url
		end
	end

	private

	# Before filters

	def require_login
		unless current_user
			store_location
			flash[:danger] = 'Please log in!'
			redirect_to login_url
		end
	end

end
