module Geocoders
  module Yandex
    class Response

      def initialize(data)
        @data = data.deep_fetch 'featureMember', {}
      end

      def objects
        @objects = @data.map do |object|
          Object.new object.deep_fetch 'Country', []
        end
      end
    end
  end
end
