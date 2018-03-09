require 'spec_helper'

feature "Test 1", :js => true do 
  
  given (:hi) { 'Test' }

  scenario "As user click on search and type text" do
    visit('/')
   # sleep(10)
    find(:id, 'et_top_search').click
   #sleep(1)
    fill_in('et_search_field', :with => hi)
    sleep(30)
  end
end

