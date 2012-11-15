class RemovePhaseIdFromSteps < ActiveRecord::Migration
  def up
    remove_column :steps, :phase_id
  end

  def down
    add_column :steps, :phase_id, :integer
  end
end
