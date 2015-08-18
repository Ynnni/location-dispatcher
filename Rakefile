require 'sinatra/activerecord/rake'
$:.unshift File.expand_path '../', __FILE__
$:.unshift File.expand_path '../lib', __FILE__
$:.unshift File.expand_path '../models', __FILE__

require 'application'

namespace :points do
  task :geocode_through_one_provider do
    ActiveRecord::Base.logger = Logger.new(STDOUT)
    Point.includes(location: :addresses).each do |point|
      next unless point.provider
      response = point.provider.geocoder.reverse_geocode point
      address = response.objects.first.to_address
      point.attach address
    end
  end
end