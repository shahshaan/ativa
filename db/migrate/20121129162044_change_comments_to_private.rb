class ChangeCommentsToPrivate < ActiveRecord::Migration
  def change
  	rename_column :posts, :comment, :private
  end
end
