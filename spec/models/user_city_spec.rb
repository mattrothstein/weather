require 'rails_helper'

RSpec.describe UserCity, type: :model do
  context "relations" do
    it { should belong_to(:user)              }
    it { should belong_to(:open_weather_city) }
  end

  context "delegate" do
    it { should delegate_method(:five_day_forecast).to(:open_weather_city) }
  end

  context "validations" do
    it { is_expected.to validate_presence_of(:open_weather_city_id) }
    it { is_expected.to validate_presence_of(:user_id)              }
  end
end
