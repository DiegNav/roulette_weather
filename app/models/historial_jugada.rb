class HistorialJugada < ApplicationRecord
  belongs_to :jugada
  belongs_to :jugador
end
