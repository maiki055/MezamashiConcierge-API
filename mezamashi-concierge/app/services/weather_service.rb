class WeatherService
  API_PATH = 'http://api.openweathermap.org/data/2.5/weather?units=metric'.freeze

  class << self
    def fetch_weather_by_coord(lat, lon)
      url = "#{API_PATH}&lat=#{lat}&lon=#{lon}"
      fetch_weather(url)
    end

    def fetch_weather(url)
      uri = URI.parse(url)
      json = Net::HTTP.get(uri)
      JSON.parse(json)
    end
  end
end