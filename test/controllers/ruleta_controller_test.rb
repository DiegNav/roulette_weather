require "test_helper"

class RuletaControllerTest < ActionDispatch::IntegrationTest
  test "should get girar" do
    get ruleta_girar_url
    assert_response :success
  end

  test "should get reiniciar" do
    get ruleta_reiniciar_url
    assert_response :success
  end
end
