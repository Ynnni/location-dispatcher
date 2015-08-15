module Geocoder
  class Base
    include HTTParty

    def initialize(provider)
      @provider = provider
    end
  end
end