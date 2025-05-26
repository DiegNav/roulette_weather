class CreateJugadaJugadors < ActiveRecord::Migration[8.0]
  def change
    create_table :jugada_jugadors do |t|
      t.references :jugada, null: false, foreign_key: true
      t.references :jugador, null: false, foreign_key: true
      t.string :clima
      t.integer :puntos_obtenidos

      t.timestamps
    end
  end
end
