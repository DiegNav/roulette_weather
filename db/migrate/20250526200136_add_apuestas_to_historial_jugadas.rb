class AddApuestasToHistorialJugadas < ActiveRecord::Migration[8.0]
  def change
    add_column :historial_jugadas, :dinero_obtenido, :integer
    add_column :historial_jugadas, :color_apostado, :string
    add_column :historial_jugadas, :apuesta, :integer
  end
end
