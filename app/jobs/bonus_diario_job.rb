class BonusDiarioJob < ApplicationJob
  queue_as :default

  def perform
    Jugador.find_each do |jugador|
      jugador.increment!(:dinero, 10_000)
    end
  end
end
