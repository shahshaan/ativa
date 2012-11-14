class Phase < ActiveRecord::Base
  attr_accessible :completion, :name, :type, :project_id

  belongs_to :project
  has_many  :posts

  validates_presence_of :project_id
  before_save :default_values

  def default_values
    self.completion ||= 0
  end


  def completed?
  	self.completion >= 100 ? true : false
  end

  def ongoing?
  	self.completion < 100 ? true : false
  end


  def onboarding?
  	self.type = "Onboarding" ? true : false
  end
end