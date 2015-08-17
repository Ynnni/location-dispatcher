module Geocoders
  module Conversion
    def to_address
      Address.new street: @street, city: @city, region: @region, country: @country
    end
  end
end