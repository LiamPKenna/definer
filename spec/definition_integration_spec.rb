require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('add a new definition', {:type => :feature}) do
  it('should allow for users to input definitions for words') do
    visit('/words')
    click_on('ADD A NEW WORD!')
    fill_in('input_word', :with => 'AddDefinition')
    click_on('Go!')
    click_on('AddDefinition')
    click_on('ADD A NEW DEFINITION!')
    fill_in('input_definition', :with => 'Test definition')
    click_on('Go!')
    expect(page).to have_content('Test definition')
  end
end

describe('delete a definition', {:type => :feature}) do
  it('should allow for users to delete added definitions') do
    visit('/words')
    click_on('ADD A NEW WORD!')
    fill_in('input_word', :with => 'DefDelWord')
    click_on('Go!')
    click_on('DefDelWord')
    click_on('ADD A NEW DEFINITION!')
    fill_in('input_definition', :with => 'Test definition')
    click_on('Go!')
    expect(page).to have_content('Test definition')
    click_on('DELETE')
    expect(page).to have_no_content('Test definition')
  end
end

describe('update a definition', {:type => :feature}) do
  it('should allow for users to update added definitions') do
    visit('/words')
    click_on('ADD A NEW WORD!')
    fill_in('input_word', :with => 'DefUpdateWord')
    click_on('Go!')
    click_on('DefUpdateWord')
    click_on('ADD A NEW DEFINITION!')
    fill_in('input_definition', :with => 'Test definition')
    click_on('Go!')
    expect(page).to have_content('Test definition')
    click_on('UPDATE')
    fill_in('input_text', :with => 'IwasUpdated')
    click_on('Go!')
    expect(page).to have_no_content('Test definition')
    expect(page).to have_content('IwasUpdated')
  end
end
