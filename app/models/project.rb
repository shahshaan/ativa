class Project < ActiveRecord::Base

  attr_accessible :active, :name

  has_many :posts
  


  # before_save :default_values

  # def default_values
  #   self.active ||= true
  # end

end
