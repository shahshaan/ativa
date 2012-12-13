class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.string :post_id
      t.string :user_id
      t.text :text

      t.timestamps
    end
  end
end
