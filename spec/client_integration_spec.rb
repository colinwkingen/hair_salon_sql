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
    fill_in('new_client', :with => 'Martin')
    click_button('Add Client')
    expect(page).to have_content('Martin')
  end
end
