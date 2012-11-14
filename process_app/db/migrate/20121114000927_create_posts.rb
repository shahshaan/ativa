class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :message
      t.string :attachment
      t.integer :user_id
      t.boolean :comment
      t.integer :phase_id

      t.timestamps
    end
  end
end
