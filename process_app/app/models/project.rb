class Project < ActiveRecord::Base
  attr_accessible :name

  has_many :phases
  has_many :steps, :through => :phases

  def current_phase(phase)
  	phases = Phase.where(:project_id => self.id)

  	onboarding_phase = phases.where(:type => "Onboarding").first
  	creative_phase = phases.where(:type => "Creative").first
    design_phase = phases.where(:type => "Design").first
    development_phase = phases.where(:type => "Development").first
    implementation_phase = phases.where(:type => "Implementation").first

    if phase != nil
      if phase == 'onboarding'
        return onboarding_phase
      end

      if phase == 'creative'
        return creative_phase
      end

      if phase == 'design'
        return design_phase
      end

      if phase == 'development'
        return  development_phase
      end

      if phase == 'implementation'
        return implementation_phase
      end
    end

  	if onboarding_phase.ongoing?
  		return onboarding_phase
  	elsif creative_phase.ongoing?
  		return creative_phase
  	end

  end

  def status?
  	phases = Phase.where(:project_id => self.id)
  	completion_amount = 0
  	phases.each do |phase|
  		completion_amount = completion_amount + phase.completion
  	end
  	completion_amount = completion_amount/phases.count
  	completion_amount >= 100 ? "Complete" : "#{completion_amount}%"
  end

end
