# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


puts 'adding admins'

# Admin.destroy_all

admins = [
			# {:first_name => 'Shaan', :last_name => 'Shah', email: 'shaan@perfectsearchmedia.com'},
			# {:first_name => 'Stanton', :last_name => 'Coville', email: 'stanton@perfectsearchmedia.com'},
			# {:first_name => 'Joel', :last_name => 'Benway', email: 'joel@perfectsearchmedia.com'},
			{:first_name => 'PSD', :last_name => '', email: 'psm@perfectsearchmedia.com'}
]

admins.each do |admin|     
  Admin.create 	first_name:    			admin[:first_name], 
  				last_name:    			admin[:last_name],
               	email:   				admin[:email],
               	password:   			admin[:first_name],
               	password_confirmation: 	admin[:first_name]
end

# puts 'adding dummy projects'

# Project.destroy_all

# projects = [
# 	{:name => "Cogent Data Solutions", :active => true},
# 	{:name => "The Big Montage", :active => true},
# 	{:name => "Soul'd", :active => true},
# 	{:name => "Derick Dermatology", :active => false},
# 	{:name => "Shalewater Solutions", :active => false},
# 	{:name => "LAX Camp", :active => false }
# ]

# projects.each do |project|     
#   Project.create 	:name => project[:name],
#   					:active => project[:active]
# end

# puts 'Adding posts to every project and every phase'

# Post.destroy_all

# posts = [
# 	{:title => 'Message Title', :user_id => User.first.id, :message => "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
# tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
# quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
# consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse
# cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non
# proident, sunt in culpa qui officia deserunt mollit anim id est laborum."},
# 	{:title => 'Message Title Number Two', :user_id => User.last.id, :message => "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
# tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam"},
# 	{:title => '', :user_id => User.last.id, :message => "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
# tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
# quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
# consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse
# cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non
# proident, sunt in culpa qui officia deserunt mollit anim id est laborum."},
# 	{:title => 'Title That Is Very Very Very Very Freaking Long', :user_id => User.first.id, :message => "Lorem ipsum dolor sit amet, consectetur adipisicing elit"}
# ]


# projects = Project.all
# phases = ['onboarding','creative','design','development','implementation']

# projects.each do |project|
# 	phases.each do |phase|
# 		posts.each do |post|
# 			Post.create 	:user_id => post[:user_id], 
#   						 	:title => post[:title],
#                				:message => post[:message],
#                				:project_id => project.id,
#                				:phase => phase
# 		end
# 	end
# end




