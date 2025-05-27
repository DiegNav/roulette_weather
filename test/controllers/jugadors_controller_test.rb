require "test_helper"

class JugadorsControllerTest < ActionDispatch::IntegrationTest
  # test "should get index" do
  #   get jugadors_index_url
  #   assert_response :success
  # end

  # test "should get girar" do
  #   get jugadors_girar_url
  #   assert_response :success
  # end

  # test "should get reiniciar" do
  #   get jugadors_reiniciar_url
  #   assert_response :success
  # end

  test "should get new" do
    get new_jugador_url
    assert_response :success
  end

  test "should create jugador" do
    assert_difference("Jugador.count") do
      post jugadors_url, params: { jugador: { nombre: "Nuevo", dinero: 12345 } }
    end
    assert_redirected_to ruleta_url
  end

  test "should get edit" do
    jugador = Jugador.create!(nombre: "Edit", dinero: 1000)
    get edit_jugador_url(jugador)
    assert_response :success
  end

  test "should update jugador" do
    jugador = Jugador.create!(nombre: "Edit", dinero: 1000)
    patch jugador_url(jugador), params: { jugador: { dinero: 2000 } }
    assert_redirected_to ruleta_url
    jugador.reload
    assert_equal 2000, jugador.dinero
  end

  test "should destroy jugador" do
    jugador = Jugador.create!(nombre: "Borrar", dinero: 1000)
    assert_difference("Jugador.count", -1) do
      delete jugador_url(jugador)
    end
    assert_redirected_to ruleta_url
  end
end
