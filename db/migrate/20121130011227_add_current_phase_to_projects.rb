class AddCurrentPhaseToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :current_phase, :string
  end
end
