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

  
end
