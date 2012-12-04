class Client < User

	attr_accessible :project_id

	belongs_to :project

	before_save :default_values
	

	def default_values
	  self.password = 'temporary'
	  self.password_confirmation = 'temporary'
	end
	
end