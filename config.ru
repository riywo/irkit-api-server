require './app'

if ENV['RACK_ENV'] == 'development'
  require 'pry'
  require 'dotenv'
  Dotenv.load
end

secret_token = ENV.fetch('SECRET_TOKEN')

map '/' + secret_token do
  run Sinatra::Application
end
