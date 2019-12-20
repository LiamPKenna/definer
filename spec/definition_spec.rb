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
  # describe('#') do
  #   it('') do
  #     expect().to(eq())
  #   end
  # end

end
