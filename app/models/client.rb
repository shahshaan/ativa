class Client < User

	attr_accessible :project_id

	belongs_to :project

	before_save :default_values
	

	def default_values
	  
	end
	
end