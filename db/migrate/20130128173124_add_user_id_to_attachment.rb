class AddUserIdToAttachment < ActiveRecord::Migration
  def change
    add_column :attachments, :user_id, :integer
  end
end
