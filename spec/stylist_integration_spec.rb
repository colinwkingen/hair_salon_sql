# require("capybara/rspec")
# require("./app")
# require('spec_helper')
# Capybara.app = Sinatra::Application
# set(:show_exceptions, false)
#
# describe('word define routing', {:type => :feature}) do
#   before() do
#     Stylist.clear()
#   end
#   it('accepts a new stylist entry') do
#     visit('/')
#     fill_in('new_stylist', :with => 'Sandra')
#     click_button('Add Stylist')
#     expect(page).to have_content('Sandra')
#   end
# end
