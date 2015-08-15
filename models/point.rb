class Point < ActiveRecord::Base
  belongs_to :location

  validates :latitude, presence: true, format: { with: /\A[-+]?\d{1,2}[.]\d+\z/ }
  validates :longitude, presence: true, format: { with: /\A[-+]?\d{1,3}[.]\d+\z/ }

  def to_param(reverse = false)
    params = [longitude, latitude]
    params.reverse! if reverse
    params.join ','
  end
end