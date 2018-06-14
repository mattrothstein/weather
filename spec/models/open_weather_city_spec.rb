require 'rails_helper'

RSpec.describe OpenWeatherCity, type: :model do
  subject { described_class.new(city_id: 2643743, name: 'miami', country: 'us') }

  context "relations" do
    it { should have_many(:user_cities) }
  end


  context "validations" do
    it { is_expected.to validate_presence_of(:city_id) }
    it { is_expected.to validate_presence_of(:name)    }
    it { is_expected.to validate_presence_of(:country) }
  end

  describe 'current_weather' do
    before do
      stub_request(:get, "http://api.openweathermap.org/data/2.5/weather?APPID=fb1c9edf19acb8411170acba2a672f53&id=2643743&units=imperial").
        with(
        headers: {
       	  'Accept'=>'*/*',
       	  'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
       	  'Host'=>'api.openweathermap.org',
       	  'User-Agent'=>'Ruby'
        }).
        to_return(status: 200, body: file_fixture('city_request.json'), headers: {})
    end
    it 'returns the weather data from open weather' do
      response = JSON.parse(file_fixture('city_request.json').read)
      expect(subject.current_weather).to eq(response)
    end
  end

  describe 'five_day_forecast' do
    before do
      stub_request(:get, "http://api.openweathermap.org/data/2.5/forecast?APPID=fb1c9edf19acb8411170acba2a672f53&cnt=5&id=2643743&units=imperial").
        with(
        headers: {
       	  'Accept'=>'*/*',
       	  'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
       	  'Host'=>'api.openweathermap.org',
       	  'User-Agent'=>'Ruby'
        }).
        to_return(status: 200, body: file_fixture('five_day_forecast.json'), headers: {})
    end
    it 'returns the weather data from open weather' do
      response = JSON.parse(file_fixture('five_day_forecast.json').read)['list']
      expect(subject.five_day_forecast).to eq(response)
    end
  end
end
