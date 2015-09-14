# This file is used by Rack-based servers to start the application.

require ::File.expand_path('../config/environment', __FILE__)


use Rack::Cors do
    allow do
      origins '*'
      # location of your API
      resource '*', :headers => :any, :methods => [:get, :post, :options, :put]
    end
end


run Rails.application
