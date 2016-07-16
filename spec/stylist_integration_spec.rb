require("capybara/rspec")
require("./app")
require('spec_helper')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('word define routing', {:type => :feature}) do
  before() do
    Stylist.clear()
  end
  it('accepts a new stylist entry') do
    visit('/')
    fill_in('new_stylist', :with => 'Sandra')
    click_button('Add')
    expect(page).to have_content('Sandra')
  end
  it('removes a stylist entry') do
    visit('/')
    fill_in('new_stylist', :with => 'Sandra')
    click_button('Add')
    click_button('Send Home')
    expect(page).to_not have_content('Sandra')
  end
  it('changes a stylists name') do
    visit('/')
    fill_in('new_stylist', :with => 'Sandra')
    click_button('Add')
    click_button('View Clients')
    fill_in('stylist_name', :with => 'Audry')
    click_button('Update Name')
    expect(page).to_not have_content('Sandra')
    expect(page).to have_content('Audry')  
  end
end
