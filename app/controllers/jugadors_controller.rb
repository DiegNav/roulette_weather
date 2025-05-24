class JugadorsController < ApplicationController
  def index
    @jugador = Jugador.first_or_create(nombre: 'Jugador 1', puntos: 0, clima: 'Desconocido')
  end

  def girar
    @jugador = Jugador.first
    climas = {
      'Soleado' => 10,
      'Lluvioso' => 5,
      'Nublado' => 2,
      'Tormenta' => 0
    }
    clima_aleatorio = climas.keys.sample
    puntos = climas[clima_aleatorio]
    @jugador.update(clima: clima_aleatorio, puntos: @jugador.puntos + puntos)
    redirect_to action: :index
  end

  def reiniciar
    @jugador = Jugador.first
    @jugador.update(puntos: 0, clima: 'Desconocido')
    redirect_to action: :index
  end
end
