require "rails_helper"

RSpec.describe UserCitiesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/user_cities").to route_to("user_cities#index")
    end

    it "routes to #new" do
      expect(:get => "/user_cities/new").to route_to("user_cities#new")
    end

    it "routes to #show" do
      expect(:get => "/user_cities/1").to route_to("user_cities#show", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/user_cities/1").to route_to("user_cities#create", :open_weather_city_id => 1)
    end

    it "routes to #destroy" do
      expect(:delete => "/user_cities/1").to route_to("user_cities#destroy", :id => "1")
    end

  end
end
