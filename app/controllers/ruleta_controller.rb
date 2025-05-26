class RuletaController < ApplicationController
  def index
    @jugador = Jugador.first_or_create(nombre: "Jugador 1", dinero: 0, clima: "Desconocido")
  end

  def girar
    colores = [
      { color: 'verde', prob: 2 },
      { color: 'rojo', prob: 49 },
      { color: 'negro', prob: 49 }
    ]
    # Generar ruleta con probabilidades
    ruleta = colores.flat_map { |c| [c[:color]] * c[:prob] }
    color_ganador = ruleta.sample

    jugada = Jugada.create
    Jugador.all.each do |jugador|
      # Apuesta entre 8% y 15% de su dinero
      porcentaje = rand(8..15)
      apuesta = (jugador.dinero * porcentaje / 100.0).floor
      siguiente_color = ruleta.sample
      # Resultado
      if siguiente_color == color_ganador
        if color_ganador == 'verde'
          ganancia = apuesta * 15
        else
          ganancia = apuesta * 2
        end
      else
        ganancia = 0
      end
      jugador.update(dinero: jugador.dinero - apuesta + ganancia, clima: color_ganador)
      jugada.historial_jugadas.create(
        jugador: jugador,
        clima: color_ganador,
        dinero_obtenido: ganancia - apuesta,
        color_apostado: siguiente_color,
        apuesta: apuesta
      )
    end
    redirect_to ruleta_path
  end

  def reiniciar
    HistorialJugada.delete_all
    Jugada.delete_all
    Jugador.update_all(dinero: 0, clima: "Desconocido")
    redirect_to ruleta_path
  end
end
