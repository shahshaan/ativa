module ProjectsHelper

	def progress_bar_level(phase)
		if phase == 'onboarding'
			level = 12
		elsif phase == 'creative'
			level = 32.5	
		elsif phase == 'design'
			level = 53.1	
		elsif phase == 'development'
			level = 73.5
		elsif phase == 'implementation'
			level = 94
		end

		return level

	end

end
