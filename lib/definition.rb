class Definition
  attr_reader :id, :word_id
  attr_accessor :text

  @@definitions = {}
  @@total_rows = 0

  def initialize(attributes)
    @text = attributes.fetch(:text)
    @word_id = attributes.fetch(:word_id)
    @id = (attributes.fetch(:id)) ? attributes.fetch(:id) : @@total_rows += 1
  end

  def save
    @@definitions[self.id] = Definition.new({
      :text=>self.text,
      :word_id=>self.word_id,
      :id=>self.id
    })
  end

  def ==(definition_to_compare)
    self.text() == definition_to_compare.text()
  end

  def update(new_text)
    @text = new_text
    @@definitions[self.id] = Definition.new({
      :text=>self.text,
      :word_id=>self.word_id,
      :id=>self.id
    })
  end

  def delete
    @@definitions.delete(@id)
  end

  def word
    Word.find(@word_id)
  end

  def self.all
    @@definitions.values()
  end

  def self.clear
    @@definitions = {}
    @@total_rows = 0
  end

  def self.find(id)
    @@definitions[id.to_i]
  end

  def self.find_by_word(word_id)
    definitions = []
    @@definitions.values.each do |definition|
      if definition.word_id == word_id.to_i
        definitions.push(definition)
      end
    end
    definitions
  end
end
