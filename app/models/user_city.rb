class UserCity < ApplicationRecord
  belongs_to :user
  belongs_to :open_weather_city

  validates_presence_of :user_id, :open_weather_city_id

  delegate :five_day_forecast, to: :open_weather_city
end
