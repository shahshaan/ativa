class Post < ActiveRecord::Base
  attr_accessible :attachment, :private, :phase, :message, :project_id, :title, :user_id, :attachment_file_name, :attachment_content_type, :attachment_file_size, :attachment_updated_at

  belongs_to :project
  
  belongs_to :user

  mount_uploader :attachment, AttachmentUploader

end
