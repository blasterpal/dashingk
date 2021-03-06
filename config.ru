require 'rubygems'
require 'bundler/setup'

# load ENV
require 'dotenv'
Dotenv.load

#App and Gems
require 'dashing'
require 'httparty'
require 'rack/console'

configure do
  set :auth_token, (ENV['DASH_API_TOKEN'] || 'YOUR_AUTH_TOKEN')

  helpers do
    def protected!
      # Put any authentication code you want in here.
      # This method is run before accessing any resource.
    end
  end
end

map Sinatra::Application.assets_prefix do
  run Sinatra::Application.sprockets
end

run Sinatra::Application

# might have to do some erb config monkeypatching?
