class Point < ActiveRecord::Base
  has_many :addresses

  validates :latitude, presence: true, format: { with: /\A[-+]?\d{1,2}[.]?\d*\z/ }
  validates :longitude, presence: true, format: { with: /\A[-+]?\d{1,3}[.]?\d*\z/ }
end