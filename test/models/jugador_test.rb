require "test_helper"

class JugadorTest < ActiveSupport::TestCase
  test "jugador válido" do
    jugador = Jugador.new(nombre: "Test", dinero: 1000)
    assert jugador.valid?
  end
end
