require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('add a new word', {:type => :feature}) do
  it('should allow for users to input words') do
    visit('/words')
    click_on('ADD A NEW WORD!')
    fill_in('input_word', :with => 'Testerino')
    click_on('Go!')
    expect(page).to have_content('Testerino')
  end
end

describe('delete a word', {:type => :feature}) do
  it('should allow for users to delete added words') do
    visit('/words')
    click_on('ADD A NEW WORD!')
    fill_in('input_word', :with => 'DeleteMe')
    click_on('Go!')
    expect(page).to have_content('DeleteMe')
    page.find('button', id: 'deleteDeleteMe').click
    expect(page).to have_no_content('DeleteMe')
  end
end
