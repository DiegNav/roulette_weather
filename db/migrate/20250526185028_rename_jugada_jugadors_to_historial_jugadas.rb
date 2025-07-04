class RenameJugadaJugadorsToHistorialJugadas < ActiveRecord::Migration[8.0]
  def change
    rename_table :jugada_jugadors, :historial_jugadas

    # Agregar columnas para la lógica de apuestas
    add_column :historial_jugadas, :dinero_obtenido, :integer
    add_column :historial_jugadas, :color_apostado, :string
    add_column :historial_jugadas, :apuesta, :integer
  end
end
