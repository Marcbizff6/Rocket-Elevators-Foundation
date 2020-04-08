class CreateInterventions < ActiveRecord::Migration[5.2]
  def change
    create_table :interventions do |t|
      t.integer :column_id
      t.integer :elevator_id
      t.date :intervention_start_date
      t.date :intervention_end_date
      t.string :intervention_result
      t.text :intervention_report
      t.string :intervention_status
    end
    add_reference :interventions, :employee, foreign_key: true
    add_reference :interventions, :building, foreign_key: true
    add_reference :interventions, :battery, foreign_key: true
  end
end
