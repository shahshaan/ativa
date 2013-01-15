class Attachment < ActiveRecord::Base
  attr_accessible :file, :message, :title, :url, :post_id

  belongs_to :post

  mount_uploader :file, FileUploader

  validates_presence_of :title

end
