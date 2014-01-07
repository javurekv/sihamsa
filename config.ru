#\ -p 4567

require './app'
set :server, 'webrick'
run Sinatra::Application