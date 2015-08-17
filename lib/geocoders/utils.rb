module Geocoders
  module Utils
    def search(data, key)
      data.fetch(key, nil) || data.find {|k, v| break search(v, key) if v.is_a? Hash}
    end
  end
end
