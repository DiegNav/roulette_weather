require "test_helper"

class JugadaTest < ActiveSupport::TestCase
  test 'jugada válida' do
    jugada = Jugada.new(color_ganador: 'rojo', max_temp: 25)
    assert jugada.valid?
  end
end
