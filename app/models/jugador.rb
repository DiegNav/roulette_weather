class Jugador < ApplicationRecord
  has_many :jugada_jugadors, dependent: :destroy

  before_validation :set_default_puntos, on: :create

  private

  def set_default_puntos
    self.puntos = 0 if puntos.nil?
  end
end
