module Geocoder
  class Base
    def initialize(provider)
      @provider = provider
    end

    include HTTParty
  end
end