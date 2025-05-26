class Jugador < ApplicationRecord
  has_many :jugadas, dependent: :destroy
end
