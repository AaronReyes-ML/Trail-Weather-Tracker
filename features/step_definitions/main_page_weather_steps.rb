Given(/the user is on the home page and wants to view just trails/)do
    Trail.create({:name => "UCCS Pedestrian Spine", :nature => "walk", :difficulty => "easy", :latitude => 38.892184, :longitude => -104.797949})
    visit trails_path(:map_features => "trails_only")
end
Then(/there should be a map and no weather details/)do
    page.should have_selector("#map")
end
Then(/there should be weather information for 0 trails/)do
    page.should have_selector("#trail_weather_count")
    page.should have_content("Map has weather details for 0 trails")
end

Given(/the user is on the home page and wants to view trails and weather/)do
    Trail.create({:name => "UCCS Pedestrian Spine", :nature => "walk", :difficulty => "easy", :latitude => 38.892184, :longitude => -104.797949})
    visit trails_path(:map_features => "weather_details")
end
Then(/there should be a map and weather details/)do
    page.should have_selector("#map")
end
Then(/there should be weather information for 1 trails/)do
    page.should have_selector("#trail_weather_count")
    page.should have_content("Map has weather details for 1 trails")
end

Given(/the user is on the home page and wants to view trails wtih weather and circles/)do
     Trail.create({:name => "UCCS Pedestrian Spine", :nature => "walk", :difficulty => "easy", :latitude => 38.892184, :longitude => -104.797949})
     visit trails_path(:map_features => "weather_details_plusoverlay")
end
Then(/there should be weather information for a trail and a cricle if applicable/)do
   expect(page).to have_content("Map has weather details for 1 trails")
   expect(page).to have_content("Map has weather a weather overlay for")
end