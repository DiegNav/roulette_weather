# app/services/clima_service.rb
require "net/http"
require "json"

# Service class responsible for handling climate-related operations and business logic.
# Typically used to interact with external climate APIs, process weather data,
# or provide climate information to other parts of the application.
class ClimaService
  API_KEY = ENV["WEATHER_API_KEY"]
  API_URL = "https://api.weatherapi.com/v1/forecast.json?key=#{API_KEY}&q=Santiago,CL&days=7&aqi=no&alerts=no"

  def self.maxima_santiago
    response = Net::HTTP.get(URI(API_URL))
    data = JSON.parse(response)
    temps = data.dig("forecast", "forecastday")&.map { |day| day.dig("day", "maxtemp_c") } || []
    max_temp = temps.max
    max_temp
  rescue StandardError => e
    Rails.logger.error("Error consultando clima: #{e}")
    nil
  end
end
