class Jugada < ApplicationRecord
  has_many :historial_jugadas, dependent: :destroy
end
