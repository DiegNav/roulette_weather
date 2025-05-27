require "test_helper"

class GenerarRondaJobTest < ActiveJob::TestCase
  test "genera una jugada y actualiza jugadores e historial" do
    Jugador.delete_all
    jugador = Jugador.create!(nombre: "Test", dinero: 10000)
    assert_difference [ "Jugada.count", "HistorialJugada.count" ], 1 do
      GenerarRondaJob.perform_now
    end
    jugador.reload
    assert_not_equal 10000, jugador.dinero, "El dinero debe cambiar según resultado"
    jugada = Jugada.last
    assert_includes %w[rojo negro verde], jugada.color_ganador
    assert jugada.max_temp.present?
    historial = jugada.historial_jugadas.find_by(jugador: jugador)
    assert historial.present?
    assert_includes %w[rojo negro verde], historial.color_apostado
    assert historial.apuesta > 0
  end
end
