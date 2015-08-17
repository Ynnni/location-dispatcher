module Geocoders
  module Yandex
    class Response
      include Geocoders::Utils

      def initialize(data)
        binding.pry
        @data = search data, 'featureMember'
      end

      def objects
        @objects = @data.map do |object|
          # Object.new object['GeoObject']['metaDataProperty']['GeocoderMetaData']['AddressDetails']['Country']
          Object.new search object, 'Country'
        end
      end
    end
  end
end
