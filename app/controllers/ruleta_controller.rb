class RuletaController < ApplicationController
  def girar
    climas = {
      "Soleado" => 10,
      "Lluvioso" => 5,
      "Nublado" => 2,
      "Tormenta" => 0
    }
    jugada = Jugada.create
    Jugador.all.each do |jugador|
      clima_aleatorio = climas.keys.sample
      puntos = climas[clima_aleatorio]
      jugador.update(clima: clima_aleatorio, puntos: jugador.puntos + puntos)
      jugada.historial_jugadas.create(jugador: jugador, clima: clima_aleatorio, puntos_obtenidos: puntos)
    end
    redirect_to jugadors_path
  end

  def reiniciar
    HistorialJugada.delete_all
    Jugada.delete_all
    Jugador.update_all(puntos: 0, clima: "Desconocido")
    redirect_to jugadors_path
  end
end
