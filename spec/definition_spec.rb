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

  # describe('#') do
  #   it('') do
  #     expect().to(eq())
  #   end
  # end

end
