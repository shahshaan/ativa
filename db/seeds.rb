# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


puts 'adding admins'

Admin.destroy_all

admins = [
			{:first_name => 'Shaan', :last_name => 'Shah', email: 'shaan@perfectsearchmedia.com'},
			{:first_name => 'Stanton', :last_name => 'Coville', email: 'stanton@perfectsearchmedia.com'},
			{:first_name => 'Joel', :last_name => 'Benway', email: 'joel@perfectsearchmedia.com'},
			{:first_name => 'Conor', :last_name => 'Keenan', email: 'conor@perfectsearchmedia.com'}
]

admins.each do |admin|     
  Admin.create 	first_name:    			admin[:first_name], 
  				last_name:    			admin[:last_name],
               	email:   				admin[:email],
               	password:   			admin[:first_name],
               	password_confirmation: 	admin[:first_name]
end

puts 'adding dummy projects'

Project.destroy_all

projects = [
	{:name => "Perfect Search Design", :active => true},
	{:name => "Sugarfoots", :active => true},
	{:name => "Owl Metals Inc.", :active => true},
	{:name => "Soul'd", :active => false}
]

projects.each do |project|     
  Project.create 	:name => project[:name],
  					:active => project[:active]
end

puts 'Adding posts to every project and every phase'

Post.destroy_all

posts = [
	{ 	
		:title => 'Welcome to Ativa!', 
		:user_id => Admin.first.id, 
		:message => "This project management tool is built to be intuitive. If you want to add a post, simply push the plus sign. To add a call, hit the 'add call' link. If there is anything not working correctly please notify me at shaan@perfectsearchmedia.com or you can often find me at the ping pong table."
	}
]


projects = Project.all
phases = ['onboarding','creative','design','development','implementation']

projects.each do |project|
	phases.each do |phase|
		posts.each do |post|
			Post.create 	:user_id => post[:user_id], 
  						 	:title => post[:title],
               				:message => post[:message],
               				:project_id => project.id,
               				:phase => phase
		end
	end
end




