class User < ApplicationRecord
  include Clearance::User
  has_many :user_cities
end
