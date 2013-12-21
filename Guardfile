require './app'

guard 'livereload' do
  watch(/app\/.+/)
  watch(/views\/.+\.haml/)
end

guard :rack, port: 9292 do
  watch('Gemfile.lock')
  watch('app.rb')
  watch(/.+\.yml/)
end
