class User < ActiveRecord::Base
  attr_accessible :email, :first_name, :last_name, :password_digest, :type, :password, :password_confirmation, :avatar

  has_many :posts

  has_secure_password
  validates_presence_of :password, :on => :create
  validates :email, :uniqueness => true
  mount_uploader :avatar, AvatarUploader

  before_create :default_values
  

  def default_values
    self.password = 'temporary'
    self.password_confirmation = 'temporary'
  end

  def admin?
  	self.type == 'Admin' ? true : false
  end

  def client?
  	self.type == 'Client' ? true : false
  end

  def full_name

    return self.first_name + " " + self.last_name
    
  end

end
