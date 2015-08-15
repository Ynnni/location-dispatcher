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
    @location = Location.new
    @point = @location.build_point longitude: params[:lon], latitude: params[:lat]
    @location.save!
    status 201
    jbuilder :point
  end

  get '/locations/:id' do
    @location = Location.find params[:id]
    jbuilder :location
  end
end