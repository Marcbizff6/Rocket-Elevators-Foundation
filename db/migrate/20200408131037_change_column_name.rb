class ChangeColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :interventions, :intervention_start_date, :start_date
    rename_column :interventions, :intervention_end_date, :end_date
    rename_column :interventions, :intervention_result, :result
    rename_column :interventions, :intervention_report, :report
    rename_column :interventions, :intervention_status, :status
    rename_column :interventions, :employee_id, :author
  end
end
