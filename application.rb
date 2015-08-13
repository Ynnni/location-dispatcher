require 'boot'

class LocationDispatcher < Sinatra::Base
  register Sinatra::StrongParams
  register Sinatra::ActiveRecordExtension

  set :show_exceptions, :after_handler

  error RequiredParamMissing do
    halt 400, env['sinatra.error'].message
  end

  post '/feed', needs: [:lat, :lon] do
    jbuilder :location
  end

  get '/locations/:id' do
    jbuilder :location
  end
end