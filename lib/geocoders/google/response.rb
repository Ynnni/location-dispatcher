module Geocoders
  module Google
    class Response
      def initialize(data)
        @data = data.fetch 'results', {}
      end

      def objects
        @objects = @data.map do |object|
          Object.new object.fetch 'address_components', []
        end
      end
    end
  end
end
