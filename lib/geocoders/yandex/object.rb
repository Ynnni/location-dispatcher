module Geocoders
  module Yandex
    class Object
      include Geocoders::Conversion

      def initialize(data)
        @data = data
        @administrative_area = @data.fetch 'AdministrativeArea', {}
        @sub_administrative_area = @administrative_area.fetch 'SubAdministrativeArea', {}
        @dependent_locality = @sub_administrative_area.fetch('Locality', {}).fetch 'DependentLocality', {}

        @country, @city, @region, @street = country, city, region, street
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
    end
  end
end