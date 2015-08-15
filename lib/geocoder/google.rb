module Geocoder
  class Google < Base
    base_uri 'https://maps.googleapis.com'

    def reverse_geocode(point)
      self.class.get '/maps/api/geocode/json', query: { format: :json, latlng: point.to_param(:reverse)}
    end
  end
end