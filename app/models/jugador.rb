class Jugador < ApplicationRecord
  has_many :historial_jugadas, dependent: :destroy

  before_validation :set_default_dinero, on: :create

  private

  def set_default_dinero
    self.dinero = 10000 if dinero.nil?
  end
end
