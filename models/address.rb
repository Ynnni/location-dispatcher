class Address < ActiveRecord::Base
  belongs_to :point
  belongs_to :provider
end