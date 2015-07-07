module MezamashiConcierge 
  module AuthenticateHelper
    def current_user
      uuid = request.headers['X-UUID'].presence
      @current_user ||= User.find_by(uuid: uuid)
    end

    def authenticate!
      error!('401 Unauthorized', 401) unless current_user
    end
  end
end