class AddCustomerIdToInterventions < ActiveRecord::Migration[5.2]
  def change
    add_column :interventions, :customerID, :integer
  end
end
