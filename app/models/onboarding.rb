class Onboarding < Phase
	attr_accessible 
	has_many :steps

	after_save :initial_post

	def initial_post
		post = Post.new
		post.phase_id = Phase.last.id
		post.title = "Welcome!"
		post.message = "In this portal, we will manage the design of your website from start to finish"
		post.save
	end
	
end