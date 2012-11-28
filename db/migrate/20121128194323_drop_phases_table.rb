class DropPhasesTable < ActiveRecord::Migration
  def change
  	drop_table :phases
  end
end
