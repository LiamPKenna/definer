require('sinatra')
require('sinatra/reloader')
require('./lib/word')
require('./lib/definition')
require('pry')
also_reload('lib/**/*.rb')

get('/') do
  erb(:welcome)
end

get('/words') do
  @words = Word.all
  erb(:words)
end

post('/') do
end
patch('/') do
end
delete('/') do
end
