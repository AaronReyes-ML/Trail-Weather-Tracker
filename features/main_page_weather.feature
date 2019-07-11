Feature: View Weather on main page
As a hiker/user,
I want to be able to view the weather for trails on the main page,
So that I can choose which trail I want to go to.

#Assigned to: Aaron

Scenario: User is on the main page and wants to view trails
Given the user is on the home page and wants to view just trails
Then there should be a map and no weather details
Then there should be weather information for 0 trails

Scenario: User is on the main page and wants to view trails and weather details
Given the user is on the home page and wants to view trails and weather
Then there should be a map and weather details
Then there should be weather information for 1 trails

Scenario: User is on the main page and wants to view trails with weather and cirlces
Given the user is on the home page and wants to view trails wtih weather and circles
Then there should be weather information for a trail and a cricle if applicable