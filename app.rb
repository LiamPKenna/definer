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

get('/words/new') do
  erb(:new_word)
end

get('/words/:id') do
  @word = Word.find(params[:id])
  @definitions = @word.definitions
  erb(:word)
end

get('/words/:id/definitions/new') do
  @word = Word.find(params[:id])
  erb(:new_definition)
end

post('/words') do
  word = Word.new({:word=>params[:input_word], :id=>nil})
  word.save
  redirect to('/words')
end

post('/words/:word_id/definitions') do
  definition = Definition.new({
    :text=>params[:input_definition],
    :word_id=>params[:word_id],
    :id=>nil
  })
  definition.save
  redirect to("/words/#{params[:word_id]}")
end

patch('/') do
end

delete('/') do
end
