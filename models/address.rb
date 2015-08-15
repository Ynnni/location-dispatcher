class Address < ActiveRecord::Base
  belongs_to :location
  belongs_to :provider
end