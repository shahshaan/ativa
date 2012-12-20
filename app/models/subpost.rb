class Subpost < ActiveRecord::Base
  attr_accessible :file, :message, :post_id, :title, :url, :user_id

  belongs_to :post
  belongs_to :user

  mount_uploader :file, FileUploader
  
end
