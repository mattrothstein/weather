json = ActiveSupport::JSON.decode(File.read('lib/seeds/city.list.json'))

json.each do |a|
  OpenWeatherCity.create!(city_id: a["id"], name: a["name"], country: a["country"])
  print "."
rescue
  print "f"
end
