class AddForeignIdsToSteps < ActiveRecord::Migration
  def change
    add_column :steps, :onboarding_id, :integer
    add_column :steps, :creative_id, :integer
  end
end
