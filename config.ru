require 'bundler'

Bundler.require

require './ledger_web'

map LedgerWeb.assets_prefix do
  run LedgerWeb.sprockets
end

map '/' do
  run LedgerWeb
end

map '/api' do
  run LedgerRest::App
end
