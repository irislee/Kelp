Feature: Visit Activity
  In order to read about an activity
  As a visitor
  I should be able to click an activity on the index page
  And see the activity's info
 
Scenario: Activity List
    Given I have an activity "Baby Moves Classes" with the location "155 Bank St"
    When I go to the list of activities
    Then I should click "Baby Moves Classes"
    And I should see the address "155 Bank St"