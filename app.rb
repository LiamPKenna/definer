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

get('/all') do
  @words = Word.all
  erb(:all)
end

get('/words/new') do
  erb(:new_word)
end

get('/words/:id') do
  @word = Word.find(params[:id])
  @definitions = @word.definitions
  erb(:word)
end

get('/words/:id/update') do
  @word = Word.find(params[:id])
  erb(:update_word)
end

get('/words/:id/definitions/new') do
  @word = Word.find(params[:id])
  erb(:new_definition)
end

get('/words/:id/definitions/:definition_id/update') do
  @word = Word.find(params[:id])
  @definition = Definition.find(params[:definition_id])
  erb(:update_definition)
end

post('/words') do
  word = Word.new({:word=>params[:input_word], :id=>nil})
  word.save
  redirect to('/words')
end

post('/words/:word_id/definitions') do
  definition = Definition.new({
    :text=>params[:input_definition],
    :word_id=>params[:word_id].to_i,
    :id=>nil
  })
  definition.save
  redirect to("/words/#{params[:word_id]}")
end

patch('/words/:id') do
  @word = Word.find(params[:id])
  @word.update(params[:input_word])
  redirect to('/words')
end

patch('/words/:id/definitions/:definition_id') do
  @definition = Definition.find(params[:definition_id])
  @definition.update(params[:input_text])
  redirect to("/words/#{params[:id]}")
end

delete('/words/:id') do
  word = Word.find(params[:id])
  word.delete
  redirect to('/words')
end

delete('/words/:id/definitions/:definition_id') do
  definition = Definition.find(params[:definition_id])
  definition.delete
  redirect to("/words/#{params[:id]}")
end
