class RemoveJugadorIdClimaPuntosFromJugadas < ActiveRecord::Migration[8.0]
  def change
    remove_reference :jugadas, :jugador, foreign_key: true
    remove_column :jugadas, :clima, :string
    remove_column :jugadas, :puntos_obtenidos, :integer
  end
end
