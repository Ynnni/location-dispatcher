require 'bundler/setup'

require 'sinatra/base'
require 'sinatra/strong-params'
require 'sinatra/jbuilder'

require 'mysql2'
require 'sinatra/activerecord'

require 'models/point'
require 'models/address'
require 'models/provider'
require 'models/google_provider'
require 'models/yandex_provider'
