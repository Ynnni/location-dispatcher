module Geocoder
  class Yandex < Base
    base_uri 'https://geocode-maps.yandex.ru'

    def reverse_geocode(point)
      response = self.class.get '/1.x/', query: { format: :json, lang: :en_US, geocode: point.to_param }
      collection = GeoObjectCollection.parse response
      address = collection.objects.first.to_address
      address.provider = @provider
    end

    class GeoObjectCollection
      def self.parse(response)
        new response['response']['GeoObjectCollection']['featureMember']
      end

      def initialize(data)
        @data = data
      end

      def objects
        @data.map do |raw_object|
          GeoObject.new raw_object['GeoObject']['metaDataProperty']['GeocoderMetaData']['AddressDetails']['Country']
        end
      end
    end

    class GeoObject
      def initialize(data)
        @data = data
        @administrative_area = @data.fetch 'AdministrativeArea', {}
        @sub_administrative_area = @administrative_area.fetch 'SubAdministrativeArea', {}
        @locality = @sub_administrative_area.fetch 'Locality', {}
        @dependent_locality = @locality.fetch 'DependentLocality', {}

        @country = @data['CountryName']
        @city = @sub_administrative_area['SubAdministrativeAreaName']
        @region = @administrative_area['AdministrativeAreaName']
        @street = @dependent_locality['DependentLocalityName']
      end

      def to_address
        Address.new street: @street, city: @city, region: @region, country: @country
      end
    end
  end
end