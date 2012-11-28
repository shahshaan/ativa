class AddPhaseToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :phase, :string
  end
end
