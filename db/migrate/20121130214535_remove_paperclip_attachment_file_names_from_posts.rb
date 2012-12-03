class RemovePaperclipAttachmentFileNamesFromPosts < ActiveRecord::Migration
  def change
  	remove_column :posts, :attachment_file_name
  	remove_column :posts, :attachment_content_type
  	remove_column :posts, :attachment_file_size
  	remove_column :posts, :attachment_updated_at
  end
end