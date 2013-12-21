Bundler.require

# require 'sinatra/base'
# require 'sinatra/backbone'
# require 'sinatra/assetpack'

class App < Sinatra::Base
  enable :raise_errors, :logging
  enable :show_exceptions  if development?

  register Sinatra::JstPages
  serve_jst '/js/templates.js'

  register Sinatra::AssetPack

  assets do
    serve '/js',     from: 'app/js'
    serve '/css',    from: 'app/css'
    serve '/images', from: 'app/images'
    serve '/fonts',  from: 'app/fonts'

    js :app, '/js/app.js', [
                            '/js/vendor/**/*.js',
                            '/js/lib/**/*.js',
                            '/js/templates.js'
                           ]
    css :app, '/css/app.css', ['/css/screen.css']

    js_compression  :jsmin    # :jsmin | :yui | :closure | :uglify
    css_compression :simple   # :simple | :sass | :yui | :sqwish
  end

  set :root,          File.expand_path('.', File.dirname(__FILE__))
  set :views,         File.expand_path('./views', File.dirname(__FILE__))
  set :public_folder, File.expand_path('./public', File.dirname(__FILE__))

  get '/' do
    haml :index
  end
end
