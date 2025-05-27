require "test_helper"

class BonusDiarioJobTest < ActiveJob::TestCase
  test "suma 10000 a todos los jugadores" do
    jugador = Jugador.create!(nombre: "Test", dinero: 5000)
    assert_difference "jugador.reload.dinero", 10000 do
      BonusDiarioJob.perform_now
    end
  end
end
