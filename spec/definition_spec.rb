require('rspec')
require('definition')
require('word')

describe('#Definition') do

  # before(:each) do
  #
  # end

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


  # describe('#') do
  #   it('') do
  #     expect().to(eq())
  #   end
  # end

end
