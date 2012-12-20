class CreateSubposts < ActiveRecord::Migration
  def change
    create_table :subposts do |t|
      t.string :title
      t.integer :user_id
      t.string :file
      t.integer :post_id
      t.string :url
      t.text :message

      t.timestamps
    end
  end
end
