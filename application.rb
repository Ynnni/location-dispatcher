require 'boot'

class LocationDispatcher < Sinatra::Base
  register Sinatra::StrongParams
  register Sinatra::ActiveRecordExtension

  set :show_exceptions, :after_handler

  error RequiredParamMissing do
    halt 400, env['sinatra.error'].message
  end

  error ActiveRecord::RecordInvalid do
    halt 400, { errors: env['sinatra.error'].record.errors }.to_json
  end

  post '/feed', needs: [:lat, :lon] do
    @point = Point.create! longitude: params[:lon], latitude: params[:lat]
    status 201
    jbuilder :point
  end

  get '/locations/:id' do
    jbuilder :location
  end
end