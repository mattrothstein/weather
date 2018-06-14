class CreateUserCities < ActiveRecord::Migration[5.2]
  def change
    create_table :user_cities do |t|
      t.references :user, foreign_key: true
      t.references :open_weather_city, foreign_key: true

      t.timestamps
    end
  end
end
