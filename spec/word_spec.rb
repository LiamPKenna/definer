require('rspec')
require('word')


describe('#Word') do

  before(:each) do
  end

  describe('.all') do
    it('returns an empty array before any words have been added') do
      expect(Word.all).to(eq([]))
    end
  end

  describe('#save') do
    it('saves a word') do
      word = Word.new({:word=>'word', :definition=>nil, :id=>nil})
      word.save
      expect(Word.all).to(eq([word]))
    end
  end

  describe('#==') do
    it('words with matching attributes are considered equal') do
      word = Word.new({:word=>'word', :definition=>nil, :id=>nil})
      word2 = Word.new({:word=>'word', :definition=>nil, :id=>nil})
      expect(word2).to(eq(word))
    end
  end

end
