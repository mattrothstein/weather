class CreateCities < ActiveRecord::Migration[5.2]
  def change
    create_table :cities do |t|
      t.references :user, foreign_key: true
      t.string :name
      t.string :state
      t.string :country
      t.string :zip_code

      t.timestamps
    end
  end
end
