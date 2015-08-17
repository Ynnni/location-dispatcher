module Geocoders
  module Google
    class Object
      include Geocoders::Conversion

      def initialize(data)
        @data = data
        @country, @region, @city, @street = country, region, street, city
      end

      def country
        search_component 'country', 'long_name'
      end

      def region
        search_component 'administrative_area_level_1', 'long_name'
      end

      def city
        search_component 'locality', 'long_name'
      end

      def street
        "#{ search_component 'route', 'long_name' } #{ search_component 'street_number', 'long_name' }"
      end

      def search_component(type, definition)
        component = @data.find do |address_component|
          types = address_component.fetch 'types', []
          types.include? type
        end
        component && component[definition]
      end
    end
  end
end