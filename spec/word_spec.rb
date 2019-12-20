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
end
