class Project < ActiveRecord::Base

  attr_accessible :active, :name, :current_phase, :post_last_updated

  has_many :posts

  has_many :clients

  before_save :default_values

  after_save :initial_posts
  

  def default_values
    self.active ||= true
    self.current_phase ||= 'onboarding'
    self.post_last_updated ||= Time.now
  end

  def initial_posts
  	Post.create(	:title => 'New Project Created',
  					:message => "Welcome! A project for #{self.name} has been created.",
  					:phase => 'onboarding',
  					:project_id => self.id,
  					:user_id => User.find_by_email("psm@perfectsearchmedia.com").id
  	)
  end

end


