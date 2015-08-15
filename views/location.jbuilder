json.id @location.id
json.point do
  json.(@location.point, :longitude, :latitude)
end

json.addresses @location.addresses do |address|
  json.provider address.provider.symbol
  json.(address, :street, :city, :region, :country)
end