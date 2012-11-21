module ApplicationHelper

	def phases
		phases =[	{:name => 'Onboarding', :icon => 'fire'},
					{:name => 'Creative', :icon => 'fire'},
					{:name => 'Design', :icon => 'fire'},
					{:name => 'Development', :icon => 'fire'},
					{:name => 'Implementation', :icon => 'fire'}
		]
		return phases
	end

	def current_user
		User.find_by_id(session["user_id"])  	
	end
end
