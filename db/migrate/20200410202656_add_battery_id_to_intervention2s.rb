class AddBatteryIdToIntervention2s < ActiveRecord::Migration[5.2]
  def change
    add_reference :intervention2s, :battery, foreign_key: true
  end
end