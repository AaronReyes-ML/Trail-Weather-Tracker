Given(/I am on the home page/) do
    Trail.create({:name => "UCCS Pedestrian Spine", :nature => "walk", :difficulty => "easy", :latitude => 38.892184, :longitude => -104.797949, :comment => "", :note => ""})
    visit trails_path
end
Then(/I should see trails/) do
    expect(page).to have_content(@trails)
end
Then(/I should see a map/) do
    page.should have_selector("#map")
end
Then(/I should see a search bar/) do
    page.should have_selector("#search")
end
Then(/I should be able to enter any characters into the search bar/) do
    fill_in('search', :with => "characters")
end
Then(/I submit a search/) do
    click_button('submit_button')
end
    

Given(/I have searched for trail "Palmer Point Trailhead"/) do
    Trail.create({:name => "Palmer Point Trailhead", :nature => "walk", :difficulty => "easy", :latitude => 38.892184, :longitude => -104.797949, :comment => "", :note => ""})
    visit trails_path
    page.should have_selector("#search")
    fill_in('search', :with => 'Palmer Point Trailhead')
end
When(/I submit the search/) do
    click_button('submit_button')
end 
Then(/relevant trails will appear on screen/) do
    page.has_content?('Palmer Point Trailhead')
end
Then(/I can interact with each of the related trails/) do
    page.has_content?('Palmer Point Trailhead')
    click_on('trail_link_search') #changed id: for this in index.html.erb
    visit trails_path #must return for next step to pass
end
Then(/I can submit another search/) do
    page.should have_selector("#search")
end


Given(/I have interacted with the search bar/) do
    Trail.create({:name => "UCCS Pedestrian Spine", :nature => "walk", :difficulty => "easy", :latitude => 38.892184, :longitude => -104.797949, :comment => "", :note => ""})
    visit trails_path
    page.should have_selector("#search")
end 
Then(/I should be able to hit enter or submit a search/) do
    click_button('submit_button')
end
Then(/all trails will appear on the main screen/) do
    expect(page).to have_content(@trails)
end


Given(/I have searched for a trail that does not exist/) do
    Trail.create({:name => "UCCS Pedestrian Spine", :nature => "walk", :difficulty => "easy", :latitude => 38.892184, :longitude => -104.797949, :comment => "", :note => ""})
    visit trails_path
    page.should have_selector("#search")
    fill_in('search', :with => '?!#?!#')
    click_button('submit_button')
end
Then(/no relevant paths should appear/) do
    page.should_not have_content("#trails")
end

Given(/I have submitted a search for trails/) do
    Trail.create({:name => "Palmer Point Trailhead", :nature => "walk", :difficulty => "easy", :latitude => 38.892184, :longitude => -104.797949, :comment => "", :note => ""})
    visit trails_path
    page.should have_selector("#search")
    fill_in('search', :with => 'Palmer Point Trailhead')
    page.has_content?('Palmer Point Trailhead')
    click_button('submit_button')
end

When(/I select an entry/) do
    click_on('trail_link_search') #changed id: for this in index.html.erb
end
# Then (/I can select an entry/) do 
# # HELP ME PLEASE :C
# end 

Then(/it will bring up the trail information on a new page/) do 
    expect(page).to have_content("Palmer Point Trailhead")
    expect(page).to have_content("Type: " + "walk")
    expect(page).to have_content("Length: " + "easy")
    expect(page).to have_content("Latitude: " + "38.892184")
    expect(page).to have_content("Longitude: " + "-104.797949")
end
Then(/I will be able to see current weather for that trail/) do
    expect(page).to have_content("Current Weather")
    expect(page).to have_content("Weather Forecast")
    expect(page).to have_content("Condition: ")
    expect(page).to have_content("Temperature: ")
    expect(page).to have_content("Wind Chill: ")
    expect(page).to have_content("Dewpoint: ")
    expect(page).to have_content("Humidity: ")
    expect(page).to have_content("Wind: ")
    expect(page).to have_content("Direction: ")
    expect(page).to have_content("Gust: ")
    expect(page).to have_content("Visibility: ")
    expect(page).to have_content("Barometric Pressure: ")
    expect(page).to have_content("Last Updated: ")
    expect(page).to have_selector("#weather_image")
end
Then(/I can return to the previous page and search for another trail/) do
    visit trails_path
    #page.evaluate_script('window.history.back()') or page.go_back
    page.should have_selector("#search")
end