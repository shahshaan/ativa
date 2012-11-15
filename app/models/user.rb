class User < ActiveRecord::Base
  attr_accessible :email, :first_name, :last_name, :password_digest, :type, :password, :password_confirmation

  has_secure_password
  validates_presence_of :password, :on => :create
  validates :email, :uniqueness => true

end
