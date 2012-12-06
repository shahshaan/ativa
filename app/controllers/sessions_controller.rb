class SessionsController < ApplicationController

	def create
	  user = User.find_by_email(params[:email])
	  if user && user.authenticate(params[:password])
	    session[:user_id] = user.id
	    if user.admin?
	    	redirect_to projects_url, :notice => "Logged in!"
	    elsif user.client?
	    	redirect_to project_url(:id => user.project.id)
	    end
	  	else redirect_to new_sessions_url, notice: "Your email and password combination didn't match!"
	  end
	end

	def destroy
	  session[:user_id] = nil
	  redirect_to new_sessions_url, :notice => "Logged out!"
	end

end