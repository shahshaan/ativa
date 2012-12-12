class ApplicationController < ActionController::Base
  protect_from_forgery

  def current_user
  	User.find_by_id(session["user_id"])  	
  end

  def require_login
  	if current_user.present?
  	 else redirect_to login_url, notice: 'Please sign in' 
  	end
  end

  def require_admin
  	if current_user.present? && current_user.admin?
  	 else redirect_to login_url, notice: 'Please sign in'
  	end
  end

  def temp_password
    password = SecureRandom.hex(n=5).upcase
    return password
  end

end
