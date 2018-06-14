class ForecastPresenter < WeatherPresenter
  def initialize(daily_weather)
    @daily_weather = daily_weather
  end

  def temp
    "#{main["temp"]} F"
  end

  def date
    Time.at(@daily_weather["dt"]).strftime('%D')
  end

  def temp_min
    "#{main["temp_min"]} F"
  end

  def temp_max
    "#{main["temp_max"]} F"
  end

  def humidity
    main["humidity"]
  end

  def condition
    @daily_weather["weather"].first["description"]
  end

  def icon
    @daily_weather["weather"].first["icon"]
  end

  private

  def main
    @daily_weather["main"]
  end
end
