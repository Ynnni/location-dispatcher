require 'boot'

class LocationDispatcher < Sinatra::Base
  register Sinatra::StrongParams
  register Sinatra::ActiveRecordExtension

  set :show_exceptions, :after_handler

  error RequiredParamMissing do
    content_type :json
    status 400
    { errors: env['sinatra.error'].message }.to_json
  end

  error ActiveRecord::RecordInvalid do
    content_type :json
    status 400
    { errors: env['sinatra.error'].record.errors }.to_json
  end

  error ActiveRecord::RecordNotFound do
    content_type :json
    status 404
    { errors: env['sinatra.error'].message }.to_json
  end

  post '/feed', needs: [:lat, :lon] do
    @location = Location.new
    @point = @location.build_point longitude: params[:lon], latitude: params[:lat]
    @location.save!
    status 201
    jbuilder :location
  end

  get '/locations/:id' do
    @location = Location.find params[:id]
    jbuilder :location
  end
end