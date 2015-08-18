class Location < ActiveRecord::Base
  has_one :point, validate: true
  has_many :addresses, dependent: :destroy
end