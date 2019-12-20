require('sinatra')
require('sinatra/reloader')
require('./lib/album')
require('pry')
also_reload('lib/**/*.rb')
get('/') do
end
post('/') do
end
patch('/') do
end
delete('/') do
end
