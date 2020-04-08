class DropInterventions < ActiveRecord::Migration[5.2]
  def up
    drop_table :interventions
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
