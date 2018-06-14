class OpenWeatherCitiesController < ApplicationController
  before_action :require_login

  def index
    @open_weather_cities = OpenWeatherCity.city_search(params[:city_name])
  end
end
