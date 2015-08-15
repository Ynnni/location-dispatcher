require 'sinatra/activerecord/rake'
$:.unshift File.expand_path '../', __FILE__
$:.unshift File.expand_path '../lib', __FILE__
$:.unshift File.expand_path '../models', __FILE__

namespace :db do
  task :load_config do
    require 'application'
  end
end