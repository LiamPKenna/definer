class Word
  attr_reader :word, :id
  @@words = {}
  @@total_rows = 0

  def initialize
    @word = word
    @id = (id) ? id : @@total_rows += 1
  end

  def self.all
    @@words.values()
  end

end
