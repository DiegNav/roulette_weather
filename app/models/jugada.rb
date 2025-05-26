class Jugada < ApplicationRecord
  has_many :jugada_jugadors, dependent: :destroy
end
