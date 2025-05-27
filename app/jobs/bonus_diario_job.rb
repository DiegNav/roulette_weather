# BonusDiarioJob is a background job responsible for handling the daily bonus logic.
# It inherits from ApplicationJob and can be enqueued to run asynchronously.
# Implement the `perform` method to define the specific actions to be executed
# when the job is processed.
class BonusDiarioJob < ApplicationJob
  queue_as :default

  def perform
    Jugador.find_each do |jugador|
      jugador.increment!(:dinero, 10_000)
    end
  end
end
