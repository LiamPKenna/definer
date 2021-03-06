require('./lib/definition')

class Word
  attr_reader :word, :id
  @@words = {}
  @@total_rows = 0

  def initialize(attributes)
    @word = attributes.fetch(:word)
    @id = (attributes.fetch(:id)) ? attributes.fetch(:id) : @@total_rows += 1
  end

  def save
    @@words[self.id] = Word.new({
      :word=>self.word,
      :definitions=>self.definitions,
      :id=>self.id
    })
  end

  def ==(word_to_compare)
    self.word() == word_to_compare.word()
  end

  def update(new_word)
    @word = new_word
    save()
  end

  def delete
    @@words.delete(@id)
  end

  def definitions
    Definition.find_by_word(@id)
  end

  def self.all
    @@words.values()
  end

  def self.clear
    @@words = {}
    @@total_rows = 0
  end

  def self.find(id)
    @@words[id.to_i]
  end

  def self.random
    words = @@words.values()
    words[rand(words.length)]
  end

end
