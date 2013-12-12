Feature: Visit Index
  In order to find an activity
  As a visitor
  I should be able to click an activity
 
Scenario: Activity List
    Given I have activities The Art Farm in the City, Ice Festival
    When I go to the list of articles
    Then I should see "The Art Farm in the City"
    And I should see "Ice Festival"