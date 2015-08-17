module Geocoders
  module Google
    class Client
      include HTTParty
      base_uri 'https://maps.googleapis.com'

      def reverse_geocode(point)
        self.class.get '/maps/api/geocode/json', query: { format: :json, latlng: point.to_param(:reverse)}
      end
    end
  end
end
