require 'bundler'

Bundler.require

# require './app'
# App.set :run, false

require './app'

map '/' do
  run App
end

map '/api' do
  run LedgerRest::App
end
