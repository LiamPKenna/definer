require('sinatra')
require('sinatra/reloader')
require('./lib/word')
require('./lib/definition')
require('pry')
also_reload('lib/**/*.rb')

get('/') do
  erb(:welcome)
end

get('/words/new') do
  erb(:new_word)
end

get('/words') do
  @words = Word.all
  erb(:words)
end

post('/words') do
  word = Word.new({:word=>params[:input_word], :id=>nil})
  word.save
  redirect to('/words')
end

patch('/') do
end
delete('/') do
end
