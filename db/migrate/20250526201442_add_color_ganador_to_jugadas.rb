class AddColorGanadorToJugadas < ActiveRecord::Migration[8.0]
  def change
    add_column :jugadas, :color_ganador, :string
  end
end
