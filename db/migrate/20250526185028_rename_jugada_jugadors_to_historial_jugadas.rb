class RenameJugadaJugadorsToHistorialJugadas < ActiveRecord::Migration[8.0]
  def change
    rename_table :jugada_jugadors, :historial_jugadas
  end
end
