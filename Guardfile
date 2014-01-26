require './app'

guard 'livereload' do
  watch(/app\/.+/)
  watch(/views\/.+\.haml/)
  watch(/spec\/.+\.js$/)
end

guard :rack, port: 9292 do
  watch('Gemfile.lock')
  watch('app.rb')
  watch(/.+\.yml/)
end

guard 'coffeescript', input: 'app/js', output: 'spec/app_js', run_at_start: true
guard 'coffeescript', input: 'spec/coffeescripts', output: 'spec/javascripts', run_at_start: true
guard :copy, from: 'app/js/vendor', to: 'spec/app_js/vendor', run_at_start: true, mkpath: true
