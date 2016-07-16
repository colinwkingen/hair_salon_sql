require("capybara/rspec")
require("./app")
require('spec_helper')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('salon routing', {:type => :feature}) do
  before() do
    Client.clear()
  end
  it('accepts a new client entry') do
    visit('/')
    fill_in('new_stylist', :with => 'Sandra')
    click_button('Add')
    click_button('View Clients')
    fill_in('new_client', :with => 'Lucy')
    click_button('Add')
    expect(page).to have_content('Lucy')
  end
  it('removes a client entry') do
    visit('/')
    fill_in('new_stylist', :with => 'Sandra')
    click_button('Add')
    click_button('View Clients')
    fill_in('new_client', :with => 'Lucy')
    click_button('Add')
    click_button('Remove Booking')
    expect(page).to_not have_content('Lucy')
  end
  it('alters a booking name') do
    visit('/')
    fill_in('new_stylist', :with => 'Sandra')
    click_button('Add')
    click_button('View Clients')
    fill_in('new_client', :with => 'Lucy')
    click_button('Add')
    fill_in('client_name', :with => 'Tom')
    click_button('Update')
    expect(page).to_not have_content('Lucy')
    expect(page).to have_content('Tom')
  end
end
