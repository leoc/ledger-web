require 'bundler'

Bundler.require

class LedgerWeb < Sinatra::Base
  set :sprockets,     Sprockets::Environment.new(root)
  set :precompile,    [
                       /\w+\.(?!js\.coffee|\.css).+/,
                       /application(\.js\.coffee|\.scss)$/,
                       /.+(\.ttf|\.eot|\.woff)$/
                      ]
  set :assets_prefix, '/assets'
  set :digest_assets, true
  set(:assets_path) { File.join public_folder, assets_prefix }

  configure do
    sprockets.append_path File.join(root, 'assets', 'javascripts')
    sprockets.append_path File.join(root, 'assets', 'stylesheets')
    sprockets.append_path File.join(root, 'assets', 'fonts')
    sprockets.append_path File.dirname(HamlCoffeeAssets.helpers_path)
    compass_gem_root = Gem.loaded_specs['compass'].full_gem_path
    sprockets.append_path File.join(compass_gem_root, 'frameworks', 'compass', 'stylesheets')
    sprockets.append_path File.join(compass_gem_root, 'frameworks', 'compass', 'stylesheets', 'compass')


    Sprockets::Helpers.configure do |config|
      config.environment = sprockets
      config.prefix      = assets_prefix
      config.digest      = digest_assets
      config.public_path = public_folder
    end
  end

  helpers do
    include Sprockets::Helpers
  end

  get '/' do
    haml :index
  end
end
