# This file is used by Rack-based servers to start the application.

require ::File.expand_path('../config/environment', __FILE__)
run Rails.application
run MezamashiConcierge::API

require 'grape/jbuilder'
use Rack::Config do |env|
  env['api.tilt.root'] = Rails.root.join 'app', 'views', 'api', 'v1'
end
