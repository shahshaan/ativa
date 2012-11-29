class AddAttachmentStringToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :attachment, :string
  end
end
