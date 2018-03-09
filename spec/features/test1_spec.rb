require 'spec_helper'

feature "Test 1", :js => true do 
  
  before(:all) do
    page.driver.browser.manage.window.resize_to(1920,1080)
  end

  scenario "As user click on search and type text" do
    visit('/')
    find(:id, 'et_top_search').click
   	input = find_field 's'
	input.send_keys 'Test', :enter
	expect(page).to have_content("Messaging Test")
	puts "***Test Result: Messaging Test found on page***"
  end
end