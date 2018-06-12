class City < ApplicationRecord
  belongs_to :user
  validates_presence_of :user_id, :name, :state, :country
end
