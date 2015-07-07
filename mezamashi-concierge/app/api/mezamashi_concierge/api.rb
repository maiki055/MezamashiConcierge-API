module MezamashiConcierge
  class API < Grape::API
    version 'v1', using: :path
    format :json
    prefix :api
    rescue_from :all do |e|
      error!("rescued from #{e}")
    end
    helpers AuthenticateHelper

    resource :users do
      desc 'Sign up user.'
      post :sign_up do
        User.create!
      end
    end

    resource :alarms do
      desc 'Return a my alarm.'
      get :my_alarm do
        authenticate!
      end
    end
  end
end