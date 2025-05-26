# RuletaController
#
# Main controller for the weather roulette logic.
# Manages actions to spin the roulette, reset the game, and display the current state.
#
# Actions:
# - index: Shows the current state of the player.
# - girar: Performs a roulette spin, calculates the winning color, processes all players' bets,
#          updates their balances, and records the play history.
# - reiniciar: Resets the game by deleting the play history and restoring the initial player balances.
#
# Private methods:
# - colores: Returns the roulette color configuration and probabilities.
# - generar_color_ganador: Randomly selects the winning color based on probabilities.
# - ruleta: Generates the weighted color array for the roulette.
# - calcular_apuesta: Calculates the bet amount for a player based on their balance.
# - calcular_ganancia: Calculates the winnings for a bet based on the bet color and the winning color.
# - procesar_jugada: Processes a player's play, updates their balance, and records the result in the history.
class RuletaController < ApplicationController
  def index; end

  def girar
    color_ganador = generar_color_ganador
    jugada = Jugada.create(color_ganador: color_ganador)

    Jugador.find_each do |jugador|
      procesar_jugada(jugador, jugada, color_ganador)
    end

    redirect_to ruleta_path
  end

  def reiniciar
    HistorialJugada.delete_all
    Jugada.delete_all
    Jugador.update_all(dinero: 10000)
    redirect_to ruleta_path
  end

  private


  def colores
    [
      { color: "verde", prob: 2 },
      { color: "rojo", prob: 49 },
      { color: "negro", prob: 49 }
    ]
  end

  def generar_color_ganador
    ruleta.sample
  end

  def ruleta
    @ruleta ||= colores.flat_map { |c| [ c[:color] ] * c[:prob] }
  end

  def calcular_apuesta(jugador)
    if jugador.dinero < 1000
      jugador.dinero
    else
      porcentaje = rand(8..15)
      (jugador.dinero * porcentaje / 100.0).floor
    end
  end

  def calcular_ganancia(apuesta, color_apostado, color_ganador)
    return 0 unless apuesta.positive? && color_apostado == color_ganador

    color_ganador == "verde" ? apuesta * 15 : apuesta * 2
  end

  def procesar_jugada(jugador, jugada, color_ganador)
    apuesta = calcular_apuesta(jugador)
    color_apostado = ruleta.sample
    ganancia = calcular_ganancia(apuesta, color_apostado, color_ganador)
    jugador.update(dinero: jugador.dinero - apuesta + ganancia)

    jugada.historial_jugadas.create(
      jugador: jugador,
      dinero_obtenido: ganancia - apuesta,
      color_apostado: color_apostado,
      apuesta: apuesta
    )
  end
end
