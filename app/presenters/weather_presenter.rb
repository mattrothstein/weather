class WeatherPresenter
  def initialize(user_city)
    @user_city         = user_city
    @open_weather_city = @user_city.open_weather_city
  end

  def location
    [city_name, country_name].join(', ')
  end

  def current_temp
    "#{current_weather["main"]["temp"]} F"
  end

  def current_condition
    "#{current_weather["weather"].first["main"]}"
  end

  def sunrise
    time(current_weather["sys"]["sunrise"])
  end

  def sunset
    time(current_weather["sys"]["sunset"])
  end

  def icon_url
    "http://openweathermap.org/img/w/#{icon}.png"
  end

  private

  def icon
    current_weather["weather"].first["icon"]
  end

  def city_name
    @open_weather_city.name
  end

  def country_name
    @open_weather_city.country
  end

  def time(timestamp)
    Time.at(timestamp).strftime('%r')
  end

  def current_weather
    @current_weather ||= @open_weather_city.current_weather
  end
end
