require 'sinatra'
require 'sinatra/partial'


set :haml, format: :html5

set :views, :scss => 'scss', :haml => 'haml', :default => 'views'
helpers do
  def find_template(views, name, engine, &block)
    _, folder = views.detect { |k,v| engine == Tilt[k] }
    folder ||= views[:default]
    super(folder, name, engine, &block)
  end
end


get '/scss/*.css' do |file|
  scss file.to_sym
end

get '/' do
  haml :index
end

get '/*.html' do |file|
  haml file.to_sym
end
