class RemoveAttachmentFromPosts < ActiveRecord::Migration
  def up
    remove_column :posts, :attachment
    remove_column :posts, :attachment_file_name
    remove_column :posts, :attachment_content_type
    remove_column :posts, :attachment_file_size
    remove_column :posts, :attachment_updated_at

  end

  def down
    add_column :posts, :attachment
    add_column :posts, :attachment_file_name
    add_column :posts, :attachment_content_type
    add_column :posts, :attachment_file_size
    add_column :posts, :attachment_updated_at
  end
end