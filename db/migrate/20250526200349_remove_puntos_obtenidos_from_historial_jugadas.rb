class RemovePuntosObtenidosFromHistorialJugadas < ActiveRecord::Migration[8.0]
  def change
    remove_column :historial_jugadas, :puntos_obtenidos, :integer
  end
end
