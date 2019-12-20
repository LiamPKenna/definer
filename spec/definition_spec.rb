require('rspec')
require('definition')
require('word')

describe('#Definition') do

  before(:each) do
    Definition.clear()
  end

  describe('#save') do
    it('saves a definition') do
      def1 = Definition.new({:text=>'text', :word_id=>nil, :id=>nil})
      def1.save
      expect(Definition.all).to(eq([def1]))
    end
  end

  describe('#==') do
    it('considers definitions with matching text to be equal') do
      def1 = Definition.new({:text=>'text', :word_id=>nil, :id=>nil})
      def2 = Definition.new({:text=>'text', :word_id=>nil, :id=>nil})
      expect(def1).to(eq(def2))
    end
  end

  describe('#update') do
    it('updates a word by id number') do
      def1 = Definition.new({:text=>'text', :word_id=>nil, :id=>nil})
      def1.save
      def1.update('new')
      expect(def1.text).to(eq('new'))
    end
  end

  describe('#delete') do
    it('deletes a word') do
      def1 = Definition.new({:text=>'text', :word_id=>nil, :id=>nil})
      def1.save
      expect(Definition.all).to(eq([def1]))
      def1.delete
      expect(Definition.all).to(eq([]))
    end
  end

  describe('.all') do
    it('returns an empty array before any definitions have been added') do
      expect(Definition.all).to(eq([]))
    end
  end

  describe('.clear') do
    it('removes all definitions from the class variable @@definitions') do
      def1 = Definition.new({:text=>'text', :word_id=>nil, :id=>nil})
      def1.save
      def2 = Definition.new({:text=>'text2', :word_id=>nil, :id=>nil})
      def2.save
      Definition.clear()
      expect(Definition.all).to(eq([]))
    end
  end

  describe('.find') do
    it('returns a definition matching a given id number') do
      def1 = Definition.new({:text=>'text', :word_id=>nil, :id=>nil})
      def1.save
      expect(Definition.find(def1.id)).to(eq(def1))
    end
  end

  describe('.find_by_word') do
    it('returns all definitions matching a given word_id number') do
      word = Word.new({:word=>'word', :definitions=>nil, :id=>nil})
      word.save
      def1 = Definition.new({:text=>'text', :word_id=>word.id, :id=>nil})
      def1.save
      expect(Definition.find_by_word(word.id)).to(eq(def1))
    end
  end

end
