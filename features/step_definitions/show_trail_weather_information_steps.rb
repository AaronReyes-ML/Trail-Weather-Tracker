Given(/the user is on the information page for trail (.+)/) do |trail|
    @trail_name = trail
    Trail.create({:name => @trail_name, :nature => "walk", :difficulty => "easy", :latitude => 38.892184, :longitude => -104.797949, :comment => "", :note => ""})
    visit trail_path(1)
end
Then(/the user should see the trails name/) do
    expect(page).to have_content(@trail_name)
end
Then(/the user should see the trails nature/) do
    expect(page).to have_content("Type: " + "walk")
end
Then(/the user should see the trails difficulty/)do
    expect(page).to have_content("Length: " + "easy")
end
Then(/the user should see the trails latitude/)do
    expect(page).to have_content("Latitude: " + "38.892184")
end
Then(/the user should see the trails longitude/)do
    expect(page).to have_content("Longitude: " + "-104.797949")
end
And(/the user should see the map/)do
    expect(page).to have_selector("#map")
end
Then(/the user should see the trails current weather/)do
    expect(page).to have_content("Current Weather")
end
Then(/the user should see the trails weather forecast/)do
    expect(page).to have_content("Weather Forecast")
end
Then(/^the user should see the current weather condition$/) do
  expect(page).to have_content("Condition: ")
end
Then(/^the user should see the current temperature$/) do
  expect(page).to have_content("Temperature: ")
end
Then(/^the user should see the wind chill$/) do
  expect(page).to have_content("Wind Chill: ")
end
Then(/^the user should see the dewpoint$/) do
  expect(page).to have_content("Dewpoint: ")
end
Then(/^the user should see the humidity$/) do
  expect(page).to have_content("Humidity: ")
end
Then(/^the user should see the wind speed$/) do
  expect(page).to have_content("Wind: ")
end
Then(/^the user should see the wind direction$/) do
  expect(page).to have_content("Direction: ")
end
Then(/^the user should see the wind gust$/) do
  expect(page).to have_content("Gust: ")
end
Then(/^the user should see the visibility$/) do
  expect(page).to have_content("Visibility: ")
end
Then(/^the user should see the barometric pressure$/) do
  expect(page).to have_content("Barometric Pressure: ")
end
Then(/^the user should see the last updated$/) do
  expect(page).to have_content("Last Updated: ")
end
Then(/the user should see the weather picture/) do
  expect(page).to have_selector("#weather_image")
end
Then(/the user should see the comments box/) do
  expect(page).to have_content("Comments")
end
Then(/the user should be able to enter any characters into the comments field/) do
    fill_in('comment', :with => "characters")
end
Then(/the user should see a comments field/) do
  expect(page).to have_selector("#submit_button")
end
Then(/the user should see the Administrator's Note/) do
  expect(page).to have_content("Administrator's Note")
end


Given(/the user is on the information page for a trail (.+) and there is a map error/) do |trail|
    @trail_name = trail
    Trail.create({:name => trail, :nature => "walk", :difficulty => "easy", :latitude => 38.892184, :longitude => -104.797949, :comment => "", :note => ""})
    visit trail_path(1)
end
Then(/the user should still see the trails name/) do
    expect(page).to have_content(@trail_name)
end
Then(/the user should still see the trails nature/) do
    expect(page).to have_content("Type: " + "walk")
end
Then(/the user should still see the trails difficulty/)do
    expect(page).to have_content("Length: " + "easy")
end
Then(/the user should still see the trails latitude/)do
    expect(page).to have_content("Latitude: " + "38.892184")
end
Then(/the user should still see the trails longitude/)do
    expect(page).to have_content("Longitude: " + "-104.797949")
end
But(/the user does not see the map/)do
    if !(find_by_id("map")) then
        expect(page).to_not have_selector("#map")
    end
end
Then(/the user should still see the trails current weather/)do
    expect(page).to have_content("Current Weather")
end
Then(/the user should still see the trails weather forecast/)do
    expect(page).to have_content("Weather Forecast")
end
Then(/^the user should still see the current weather condition$/) do
  expect(page).to have_content("Condition: ")
end
Then(/^the user should still see the current temperature$/) do
  expect(page).to have_content("Temperature: ")
end
Then(/^the user should still see the wind chill$/) do
  expect(page).to have_content("Wind Chill: ")
end
Then(/^the user should still see the dewpoint$/) do
  expect(page).to have_content("Dewpoint: ")
end
Then(/^the user should still see the humidity$/) do
  expect(page).to have_content("Humidity: ")
end
Then(/^the user should still see the wind speed$/) do
  expect(page).to have_content("Wind: ")
end
Then(/^the user should still see the wind direction$/) do
  expect(page).to have_content("Direction: ")
end
Then(/^the user should still see the wind gust$/) do
  expect(page).to have_content("Gust: ")
end
Then(/^the user should still see the visibility$/) do
  expect(page).to have_content("Visibility: ")
end
Then(/^the user should still see the barometric pressure$/) do
  expect(page).to have_content("Barometric Pressure: ")
end
Then(/^the user should still see the last updated$/) do
  expect(page).to have_content("Last Updated: ")
end
Then(/the user should still see the weather picture/) do
  expect(page).to have_selector("#weather_image")
end
Then(/the user should still see the comments box/) do
  expect(page).to have_content("Comments")
end
Then(/the user should still see a comments field/) do
  expect(page).to have_selector("#submit_button")
end
Then(/the user should still be able to enter any characters into the comments field/) do
    fill_in('comment', :with => "characters")
end
Then(/the user should still see the Administrator's Note/) do
  expect(page).to have_content("Administrator's Note")
end