class Weather < ActiveRecord::Base
  belongs_to :city

  def update_by_api_info(info)
      weather_info = info['weather'][0]
      main_info    = info['main']
      wind_info    = info['wind']
      clouds_info  = info['clouds']

      self.weather     = weather_info['main']
      self.description = weather_info['description']
      self.temp        = main_info['temp']
      self.temp_min    = main_info['temp_min']
      self.temp_max    = main_info['temp_max']
      self.pressure    = main_info['pressure']
      self.humidity    = main_info['humidity']
      self.wind_speed  = wind_info['speed']
      self.wind_deg    = wind_info['deg']
      if info.has_key?('rain')
        puts info['rain']
        key, value = info['rain'].first
        self.rain_volume = value
        self.rain_hour   = key
      end
      if info.has_key?('snow')
        key, value = info['snow'].first
        self.snow_volume = value
        self.snow_hour   = key
      end
      self.cloudiness    = clouds_info['all']
      self.calculated_at = Time.at(info['dt'])

      return weather
    end
end
