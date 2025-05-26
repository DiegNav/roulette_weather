# Controller for managing Jugador (Player) actions in the Ruleta Clima game.
#
# Actions:
# - index: Initializes or retrieves the first Jugador, setting default values if necessary.
# - girar: Simulates spinning the weather roulette, updates the Jugador's weather and points,
#          and records the play in the history.
# - reiniciar: Resets the Jugador's points and weather to their initial state.
# - new: Renders a form for creating a new Jugador.
# - create: Handles the submission of the new Jugador form, saving the Jugador to the database.
#
# Assumptions:
# - There is always at least one Jugador in the database.
# - The Jugador model has associations to jugadas (plays/history).
#
# Example usage:
#   GET /jugadors           # Calls index
#   POST /jugadors/girar    # Calls girar
#   POST /jugadors/reiniciar # Calls reiniciar
#   GET /jugadors/new       # Calls new
#   POST /jugadors          # Calls create
#
class JugadorsController < ApplicationController
  def index
    @jugador = Jugador.first_or_create(nombre: "Jugador 1", puntos: 0, clima: "Desconocido")
  end

  def girar
    climas = {
      "Soleado" => 10,
      "Lluvioso" => 5,
      "Nublado" => 2,
      "Tormenta" => 0
    }
    Jugador.all.each do |jugador|
      clima_aleatorio = climas.keys.sample
      puntos = climas[clima_aleatorio]
      jugador.update(clima: clima_aleatorio, puntos: jugador.puntos + puntos)
      # Registrar la jugada en el historial
      jugador.jugadas.create(clima: clima_aleatorio, puntos_obtenidos: puntos)
    end
    redirect_to action: :index
  end

  def reiniciar
    @jugador = Jugador.first
    @jugador.update(puntos: 0, clima: "Desconocido")
    redirect_to action: :index
  end

  def new
    @jugador = Jugador.new
  end

  def create
    @jugador = Jugador.new(jugador_params)
    if @jugador.save
      redirect_to jugadors_path, notice: 'Jugador creado exitosamente.'
    else
      render :new
    end
  end

  private

  def jugador_params
    params.require(:jugador).permit(:nombre)
  end
end
