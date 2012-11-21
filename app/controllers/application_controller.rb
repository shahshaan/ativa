class ApplicationController < ActionController::Base
  protect_from_forgery

  def current_user
  	User.find_by_id(session["user_id"])  	
  end

  def require_login
  	if current_user.present?
  		else redirect_to new_sessions_url, notice: 'Please login.' 
  	end
  end

  def require_admin
  	if current_user.present? && current_user.admin?
  	else redirect_to new_sessions_url, notice: 'You gotta work for Perfect Search Design to access this page!'
  	end
  end

end
