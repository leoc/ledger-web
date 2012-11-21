require './ledger_web'

map LedgerWeb.assets_prefix do
  run LedgerWeb.sprockets
end

map '/' do
  run LedgerWeb
end
