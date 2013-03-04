class AddContractToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :contract, :string
  end
end
