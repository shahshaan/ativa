class AddPhaseIdToSteps < ActiveRecord::Migration
  def change
    add_column :steps, :phase_id, :integer
  end
end
