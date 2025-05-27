# Job responsible for generating a new "ronda" (round) in the application.
# This job can be enqueued to run asynchronously using ActiveJob.
#
# Example usage:
#   GenerarRondaJob.perform_later
#
# Inherit from ApplicationJob to leverage Rails job processing features.
class GenerarRondaJob < ApplicationJob
  queue_as :default

  def perform
    @color_ganador = elegir_color
    @max_temp = ClimaService.maxima_santiago
    @jugada = Jugada.create(color_ganador: @color_ganador, max_temp: @max_temp)

    Jugador.find_each { |jugador| procesar_jugador(jugador) }
  end

  private

  def elegir_color
    weighted_sample({ "verde" => 2, "rojo" => 49, "negro" => 49 })
  end

  def weighted_sample(distribucion)
    distribucion.flat_map { |k, v| [ k ] * v }.sample
  end

  def procesar_jugador(jugador)
    apuesta = calcular_apuesta(jugador.dinero)
    return if apuesta <= 0

    color_apostado = elegir_color
    ganancia = calcular_ganancia(apuesta, color_apostado)
    jugador.update(dinero: jugador.dinero - apuesta + ganancia)

    @jugada.historial_jugadas.create(
      jugador: jugador,
      dinero_obtenido: ganancia - apuesta,
      color_apostado: color_apostado,
      apuesta: apuesta
    )
  end

  def calcular_apuesta(dinero)
    return 0 if dinero <= 0
    return dinero if dinero <= 1000

    porcentaje = @max_temp && @max_temp > 23 ? rand(3..7) : rand(8..15)
    (dinero * porcentaje / 100.0).floor
  end

  def calcular_ganancia(apuesta, color_apostado)
    return 0 unless color_apostado == @color_ganador
    color_apostado == "verde" ? apuesta * 15 : apuesta * 2
  end
end
