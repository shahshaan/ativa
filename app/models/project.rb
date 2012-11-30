class Project < ActiveRecord::Base

  attr_accessible :active, :name, :current_phase

  has_many :posts


  


  # before_save :default_values

  # def default_values
  #   self.active ||= true
  # end

end
