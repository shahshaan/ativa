class AddAttachmentIdToNote < ActiveRecord::Migration
  def change
    add_column :notes, :attachment_id, :integer
  end
end
