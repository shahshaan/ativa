class CreatePhases < ActiveRecord::Migration
  def change
    create_table :phases do |t|
      t.string :name
      t.string :type
      t.integer :completion

      t.timestamps
    end
  end
end
