require 'open_weather'

class OpenWeatherCity < ApplicationRecord
  # APPID needs to be in an environment variable
  OPEN_WEATHER_OPTIONS = { units: "imperial", APPID: "fb1c9edf19acb8411170acba2a672f53"}
  has_many :user_cities

  validates_presence_of :city_id, :name, :country

  def self.city_search(name)
    if name
      where('name ILIKE ?', name.strip)
    end
  end

  def current_weather
    @current_weather ||= OpenWeather::Current.city_id(city_id, OPEN_WEATHER_OPTIONS)
  end

  def five_day_forecast
    options = OPEN_WEATHER_OPTIONS.merge(cnt: 5)
    OpenWeather::Forecast.city_id(city_id, options)["list"]
  end
end
