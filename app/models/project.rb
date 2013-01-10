class Project < ActiveRecord::Base

  attr_accessible :active, :name, :current_phase, :post_last_updated

  has_many :posts

  has_many :clients

  before_save :default_values

  after_create :initial_posts

  validates_presence_of :name, :message => "The least you could do is provide a name for the project"
  

  def default_values
    if self.active == nil then self.active = true end
    self.current_phase ||= 'onboarding'
    self.post_last_updated ||= Time.now
  end

  def initial_posts
  	Post.create(	:title => 'New Project Created',
  					:message => "Welcome! A project for #{self.name} has been created.",
  					:phase => 'onboarding',
  					:project_id => self.id,
  					:user_id => User.find_by_email("shaan@perfectsearchmedia.com").id
  	)
  end

  def status
    if self.active? then return 'Ongoing' else return 'Completed!' end
  end

  def completed?
    if self.active? then false else true end
  end

  def status_change(status)
    if status == "true"
      self.update_attributes(:active => true) 
    elsif status == "false"
     self.update_attributes(:active => false) 
    end
  end

end


