class AddPostLastUpdateToProjects < ActiveRecord::Migration
  def change
  	add_column :projects, :post_last_updated, :datetime
  end
end
