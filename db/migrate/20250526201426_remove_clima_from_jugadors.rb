class RemoveClimaFromJugadors < ActiveRecord::Migration[8.0]
  def change
    remove_column :jugadors, :clima, :string
  end
end
