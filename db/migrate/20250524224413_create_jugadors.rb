class CreateJugadors < ActiveRecord::Migration[8.0]
  def change
    create_table :jugadors do |t|
      t.string :nombre
      t.integer :puntos
      t.string :clima

      t.timestamps
    end
  end
end
