require 'test_helper'

class RuletaFlowTest < ActionDispatch::IntegrationTest
  test 'flujo completo: crear jugador, girar ruleta, editar y eliminar' do
    Jugador.delete_all
    # Crear jugador
    post jugadors_url, params: { jugador: { nombre: 'Flow', dinero: 5000 } }
    jugador = Jugador.find_by(nombre: 'Flow')
    assert jugador

    # Girar ruleta (simular job)
    assert_difference ['Jugada.count', 'HistorialJugada.count'], 1 do
      GenerarRondaJob.perform_now
    end
    jugador.reload
    assert_not_nil jugador.dinero

    # Editar jugador
    patch jugador_url(jugador), params: { jugador: { dinero: 9999 } }
    jugador.reload
    assert_equal 9999, jugador.dinero

    # Eliminar jugador
    assert_difference('Jugador.count', -1) do
      delete jugador_url(jugador)
    end
  end
end
