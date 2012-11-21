require './ledger_web'

guard('sprockets2',
      :sprockets   => LedgerWeb.sprockets,
      :assets_path => LedgerWeb.assets_path,
      :precompile  => LedgerWeb.precompile,
      :digest      => LedgerWeb.digest_assets) do

  watch %r(^assets/.+$)
  watch 'ledger_web.rb'
end

guard 'livereload' do
  watch(%r{public/.+\.(css|js|html)})
  watch(%r{views/.+\.haml})
end
