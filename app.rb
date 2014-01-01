Bundler.require

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
                            '/js/vendor/jquery-*.js',
                            '/js/vendor/hammer-*.js',
                            '/js/vendor/underscore-*.js',
                            '/js/vendor/backbone-*.js',
                            '/js/vendor/haml.js',
                            '/js/templates.js',
                            '/js/lib/application.js',
                            '/js/lib/models/**/*.js',
                            '/js/lib/views/**/*.js',
                            '/js/lib/collections/**/*.js',
                            '/js/lib/router.js',
                            '/js/lib/start.js'
                           ]
    css :app, '/css/app.css', ['/css/screen.css']

    js_compression  :jsmin
    css_compression :simple
  end

  set :root,          File.expand_path('.', File.dirname(__FILE__))
  set :views,         File.expand_path('./app/views', File.dirname(__FILE__))
  set :public_folder, File.expand_path('./public', File.dirname(__FILE__))

  get '/' do
    @reports = YAML.load_file('./ledger-web.yml')['reports']
    haml :index
  end
end
