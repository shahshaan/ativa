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
			{:first_name => 'Joel', :last_name => 'Benway', email: 'joel@perfectsearchmedia.com'}
]

admins.each do |admin|     
  Admin.create 	first_name:    			admin[:first_name], 
  				last_name:    			admin[:last_name],
               	email:   				admin[:email],
               	password:   			admin[:first_name],
               	password_confirmation: 	admin[:first_name]
end