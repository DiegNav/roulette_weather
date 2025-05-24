require "test_helper"

class JugadorsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get jugadors_index_url
    assert_response :success
  end

  test "should get girar" do
    get jugadors_girar_url
    assert_response :success
  end

  test "should get reiniciar" do
    get jugadors_reiniciar_url
    assert_response :success
  end
end
