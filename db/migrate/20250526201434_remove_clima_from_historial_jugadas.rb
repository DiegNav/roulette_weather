class RemoveClimaFromHistorialJugadas < ActiveRecord::Migration[8.0]
  def change
    remove_column :historial_jugadas, :clima, :string
  end
end
