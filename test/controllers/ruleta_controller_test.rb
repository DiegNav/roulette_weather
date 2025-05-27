require "test_helper"

class RuletaControllerTest < ActionDispatch::IntegrationTest
  test "should get girar" do
    get girar_ruleta_url
    assert_redirected_to ruleta_url
  end

  test "should get reiniciar" do
    get reiniciar_ruleta_url
    assert_redirected_to ruleta_url
  end

  test "should get index" do
    get ruleta_url
    assert_response :success
  end
end
