class RenamePuntosToDineroInJugadors < ActiveRecord::Migration[8.0]
  def change
    rename_column :jugadors, :puntos, :dinero
  end
end
