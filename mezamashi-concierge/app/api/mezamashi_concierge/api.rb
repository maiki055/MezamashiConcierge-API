module MezamashiConcierge
  class API < Grape::API
    version 'v1', using: :path
    format :json
    formatter :json, Grape::Formatter::Jbuilder
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

      desc 'Register using railroad.'
      params do
        requires :railroad_id, type: Integer, desc: "Railroad id."
      end
      patch :railroad do
        authenticate!
        current_user.update(railroad_id: params[:railroad_id])
      end

      desc 'Register living city.'
      params do
        requires :city_id, type: Integer, desc: "City id."
      end
      patch :city do
        authenticate!
        current_user.update(city_id: params[:city_id])
      end
    end

    resource :alarms do
      desc 'Return a my alarm.'
      get :my_alarm do
        authenticate!
        current_user
      end
    end

    resource :areas do
      desc 'Return areas.'
      get '', jbuilder: 'areas/index.json.jbuilder' do
        @areas = Area.includes(prefectures: :cities, railroad_companies: :railroads).all
      end
    end
  end
end