module ApplicationHelper

	def current_user
		User.find_by_id(session["user_id"])  	
	end

	def admin?
		current_user.admin? ? true : false
	end
	
end
