class AddMaxTempToJugadas < ActiveRecord::Migration[8.0]
  def change
    add_column :jugadas, :max_temp, :float
  end
end
