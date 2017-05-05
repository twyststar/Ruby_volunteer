require('capybara/rspec')
require('./app')
require('spec_helper')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('adding and viewing a project', {:type => :feature}) do
  it('allows user to add project and view a single projects details') do
    visit('/')
    fill_in('name', :with => 'Kitten Wash')
    fill_in('description', :with => 'Get our kittens polished and ready for adoption!')
    click_button('Add Project')
    click_on('Kitten Wash')
    expect(page).to have_content('Get our kittens polished and ready for adoption!')
  end
end
describe('adding and viewing a volunteer', {:type => :feature}) do
  it('allows user to add volunteer to a project and view a single volunteers details') do
    visit('/')
    fill_in('name', :with => 'Kitten Wash')
    fill_in('description', :with => 'Get our kittens polished and ready for adoption!')
    click_button('Add Project')
    click_on('Kitten Wash')
    fill_in('name', :with => 'Felix')
    fill_in('skill', :with => 'Cats')
    click_button('Add Volunteer')
    click_on('Felix')
    expect(page).to have_content('Cats')
  end
end
