class WeatherService
  API_PATH = 'http://api.openweathermap.org/data/2.5/weather?units=metric'.freeze

  class << self
    def fetch_cites_weather
      cites = City.all
      cites.each do |city|
        info = fetch_weather_by_coord(city.latitude, city.longitude)
        weather = city.weather ? city.weather : Weather.new
        weather.update_by_api_info(info)
        weather.city = city
        weather.save!
      end
    end

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