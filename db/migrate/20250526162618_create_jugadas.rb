class CreateJugadas < ActiveRecord::Migration[8.0]
  def change
    create_table :jugadas do |t|
      t.references :jugador, null: false, foreign_key: true
      t.string :clima
      t.integer :puntos_obtenidos

      t.timestamps
    end
  end
end
