# Controller for managing Jugador (Player) actions in the Ruleta Clima game.
#
# Actions:
# - index: Initializes or retrieves the first Jugador, setting default values if necessary.
# - new: Renders a form for creating a new Jugador.
# - create: Handles the submission of the new Jugador form, saving the Jugador to the database.
# - update: Updates the points of an existing Jugador.
# - destroy: Deletes a Jugador from the database.
#
# Assumptions:
# - There is always at least one Jugador in the database.
# - The Jugador model has associations to jugadas (plays/history).
#
# Example usage:
#   GET /jugadors           # Calls index
#   GET /jugadors/new       # Calls new
#   POST /jugadors          # Calls create
#   PATCH/PUT /jugadors/:id # Calls update
#   DELETE /jugadors/:id    # Calls destroy
#
class JugadorsController < ApplicationController
  def index
    @jugador = Jugador.first_or_create(nombre: "Jugador 1", puntos: 0, clima: "Desconocido")
  end

  def new
    @jugador = Jugador.new
  end

  def create
    @jugador = Jugador.new(jugador_params)
    if @jugador.save
      redirect_to jugadors_path, notice: "Jugador creado exitosamente."
    else
      render :new
    end
  end

  def update
    @jugador = Jugador.find(params[:id])
    if @jugador.update(jugador_params)
      redirect_to jugadors_path, notice: "Puntos actualizados."
    else
      render :edit
    end
  end

  def destroy
    @jugador = Jugador.find(params[:id])
    @jugador.destroy
    redirect_to jugadors_path, notice: "Jugador eliminado exitosamente."
  end

  private

  def jugador_params
    params.require(:jugador).permit(:nombre, :puntos)
  end
end
