class UserCitiesController < ApplicationController
  before_action :require_login
  before_action :set_user_city, only: [:show, :destroy]

  def index
    @user_cities = current_user.user_cities
  end

  def show
    @city     = WeatherPresenter.new(@user_city)
    @forecast = @user_city.five_day_forecast
  end

  def create
    @user_city = current_user.user_cities.build(user_city_params)
    respond_to do |format|
      if @user_city.save
        format.html { redirect_to @user_city, notice: 'User city was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def destroy
    @user_city.destroy
    respond_to do |format|
      format.html { redirect_to user_cities_url, notice: 'User city was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_user_city
      @user_city = UserCity.find(params[:id])
    end

    def user_city_params
      params.permit(:user_id, :open_weather_city_id)
    end
end
