require('rspec')
require('word')


describe('#Word') do

  before(:each) do
    Word.clear
  end

  describe('#save') do
    it('saves a word') do
      word = Word.new({:word=>'word', :definitions=>nil, :id=>nil})
      word.save
      expect(Word.all).to(eq([word]))
    end
  end

  describe('#==') do
    it('considers words with matching attributes equal') do
      word = Word.new({:word=>'word', :definitions=>nil, :id=>nil})
      word2 = Word.new({:word=>'word', :definitions=>nil, :id=>nil})
      expect(word2).to(eq(word))
    end
  end

  describe('#update') do
    it('updates a word by id number') do
      word = Word.new({:word=>'word', :definitions=>nil, :id=>nil})
      word.save
      word.update('new')
      expect(word.word).to(eq('new'))
    end
  end

  describe('#delete') do
    it('deletes a word by id number') do
      word = Word.new({:word=>'word', :definitions=>nil, :id=>nil})
      word.save
      expect(Word.all).to(eq([word]))
      word.delete(word.id)
      expect(Word.all).to(eq([]))
    end
  end

  describe('.all') do
    it('returns an empty array before any words have been added') do
      expect(Word.all).to(eq([]))
    end
  end

  describe('.clear') do
    it('removes all words from the class variable @@words') do
      word = Word.new({:word=>'word', :definitions=>nil, :id=>nil})
      word.save
      word2 = Word.new({:word=>'word2', :definitions=>nil, :id=>nil})
      word2.save
      Word.clear()
      expect(Word.all).to(eq([]))
    end
  end

  describe('.find') do
    it('returns a word matching a given id number') do
      word = Word.new({:word=>'word', :definitions=>nil, :id=>nil})
      word.save
      expect(Word.find(word.id)).to(eq(word))
    end
  end

end
