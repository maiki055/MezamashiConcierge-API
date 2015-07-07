module MezamashiConcierge
  class API < Grape::API
    version 'v1', using: :path
    format :json
    prefix :api

    resource :alarms do
      desc 'Return a my alarm.'
      get :my_alarm do
      end
    end
  end
end