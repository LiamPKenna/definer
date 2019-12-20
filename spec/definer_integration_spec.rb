require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('app.rb', {:type => :feature}) do
  it('should allow for users to input words') do
    visit('/words')
    click_on('ADD A NEW WORD!')
    fill_in('input_word', :with => 'Testerino')
    click_on('Go!')
    expect(page).to have_content('Testerino')
  end

end
