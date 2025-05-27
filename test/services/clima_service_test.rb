require "test_helper"

class ClimaServiceTest < ActiveSupport::TestCase
  test "devuelve un número para la máxima de Santiago" do
    max = ClimaService.maxima_santiago
    assert max.is_a?(Numeric), "Debe devolver un número"
  end
end
