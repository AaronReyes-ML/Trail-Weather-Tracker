Feature: View Weather for an individual trail.
As a hiker/user
I want users to be able to click on a trail.
So that they can view more detailed weather information for a specific trail.

Scenario: User is on the information page of a trail
Given the user is on the information page for trail UCCS Pedestrian Spine
Then the user should see the trails name
Then the user should see the trails nature
Then the user should see the trails difficulty
Then the user should see the trails latitude
Then the user should see the trails longitude
And the user should see the map
Then the user should see the trails current weather
Then the user should see the current weather condition
Then the user should see the current temperature
Then the user should see the wind chill
Then the user should see the dewpoint
Then the user should see the humidity
Then the user should see the wind speed
Then the user should see the wind direction
Then the user should see the wind gust
Then the user should see the visibility
Then the user should see the barometric pressure
Then the user should see the last updated
Then the user should see the trails weather forecast
Then the user should see the weather picture
Then the user should see the comments box
Then the user should be able to enter any characters into the comments field
Then the user should see a comments field
Then the user should see the Administrator's Note


Scenario: User is on the information page of a trail and there is an error
Given the user is on the information page for a trail UCCS Pedestrian Spine and there is a map error
Then the user should still see the trails name
Then the user should still see the trails nature
Then the user should still see the trails difficulty
Then the user should still see the trails latitude
Then the user should still see the trails longitude
But the user does not see the map
Then the user should still see the trails current weather
Then the user should still see the trails weather forecast
Then the user should still see the current temperature
Then the user should still see the wind chill
Then the user should still see the dewpoint
Then the user should still see the humidity
Then the user should still see the wind speed
Then the user should still see the wind direction
Then the user should still see the wind gust
Then the user should still see the visibility
Then the user should still see the barometric pressure
Then the user should still see the last updated
Then the user should still see the trails weather forecast
Then the user should still see the weather picture
Then the user should still see the comments box
Then the user should still see a comments field
Then the user should still be able to enter any characters into the comments field
Then the user should still see the Administrator's Note