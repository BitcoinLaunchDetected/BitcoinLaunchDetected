# Guard configuration
guard 'livereload' do
  watch(%r{app/views/.+\.(erb|haml|slim)$})
  watch(%r{app/helpers/.+\.rb})
  watch(%r{public/.+\.(css|js|html)})
  watch(%r{config/locales/.+\.yml})
  # Rails Assets Pipeline
  watch(%r{(app|vendor)(/assets/\w+/(.+\.(scss|css|js|html|png|jpg))).*}) { |m| "/assets/#{m[3]}" }
end

# This is an example with all options that you can specify for guard-process
guard 'process', :name => 'server', :command => 'bundle exec puma -C config/puma.rb' do
  watch('Gemfile.lock')
  watch('config')
  watch('db')
  watch('app/models')
end
