require "test_helper"

class HistorialJugadaTest < ActiveSupport::TestCase
  test "se crea correctamente con datos válidos" do
    jugador = Jugador.create!(nombre: "Test", dinero: 10000)
    jugada = Jugada.create!(color_ganador: "rojo", max_temp: 25)
    historial = HistorialJugada.new(jugador: jugador, jugada: jugada, color_apostado: "rojo", apuesta: 1000, dinero_obtenido: 2000)
    assert historial.save
  end
end
