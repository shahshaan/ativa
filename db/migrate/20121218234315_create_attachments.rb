class CreateAttachments < ActiveRecord::Migration
  def change
    create_table :attachments do |t|
      t.string :file
      t.string :url
      t.string :title
      t.string :message

      t.timestamps
    end
  end
end
