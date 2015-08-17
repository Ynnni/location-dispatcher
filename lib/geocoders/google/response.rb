module Geocoder
  module Google
    class Response

      def initialize(data)
        @data = data
        @administrative_area = @data.fetch 'AdministrativeArea', {}
        @sub_administrative_area = @administrative_area.fetch 'SubAdministrativeArea', {}
        @locality = @sub_administrative_area.fetch 'Locality', {}
        @dependent_locality = @locality.fetch 'DependentLocality', {}

        @country = country
        @city = city
        @region = region
        @street = street
      end

      def country
        @data['CountryName']
      end

      def city
        @sub_administrative_area['SubAdministrativeAreaName']
      end

      def region
        @administrative_area['AdministrativeAreaName']
      end

      def street
        @dependent_locality['DependentLocalityName']
      end

      def to_address
        Address.new street: @street, city: @city, region: @region, country: @country
      end
    end
  end
end
