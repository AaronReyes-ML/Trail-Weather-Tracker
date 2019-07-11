Feature: Search for a trail 
As a hiker 
So that I can find the best trail based on location, difficulty, and weather. 
I want to enjoy my hike and not spend a long time figuring out where to go.

#Task 5 := Josh
Scenario: I am on the home page
Given I am on the home page
Then I should see trails
Then I should see a map
Then I should see a search bar
Then I should be able to enter any characters into the search bar
Then I submit a search

Scenario: User is on the home page and searches for a trail
Given I have searched for trail "Palmer Point Trailhead"
When I submit the search
Then relevant trails will appear on screen
Then I can interact with each of the related trails
Then I can submit another search

Scenario: User is on the home page and attempts to search nothing => happy path
Given I have interacted with the search bar
Then I should be able to hit enter or submit a search
Then all trails will appear on the main screen
Then I can interact with each of the related trails
Then I can submit another search

Scenario: User has searched and no relevant searches are found => sad path
Given I have searched for a trail that does not exist
Then no relevant paths should appear
Then I can submit another search
#note this includes searches like !#$$(*&^*(!%H:L), where there obviously won't be a path like this.

Scenario: User has searched a trail and found a desired trail => happy path
Given I have submitted a search for trails
When I select an entry
Then it will bring up the trail information on a new page
Then I will be able to see current weather for that trail
Then I can return to the previous page and search for another trail

#note other tests may be added, including a character limit to the search box.