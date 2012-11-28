class AddProjectIdToPosts < ActiveRecord::Migration
  def change
  	remove_column :posts, :phase_id
  	add_column :posts, :project_id, :integer
  end
end
