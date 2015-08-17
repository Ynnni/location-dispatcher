module Geocoders
  module Yandex
    class Client
      include HTTParty
      base_uri 'https://geocode-maps.yandex.ru'

      def reverse_geocode(point)
        response = self.class.get '/1.x/', query: { format: :json, lang: :en_US, geocode: point.to_param }
        Response.new response
      end
    end
  end
end
