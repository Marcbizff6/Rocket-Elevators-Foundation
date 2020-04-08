class FixColumnDefaultValue < ActiveRecord::Migration[5.2]
  def up
    change_column :interventions, :result, :string, :default => "incomplete"
    change_column :interventions, :status, :string, :default => "pending"
  end

  def down
    change_column :interventions, :result, :string, :default => nil
    change_column :interventions, :status, :string, :default => nil
  end
end
