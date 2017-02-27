Feature:  Ads management

  Scenario: User is able to create new advertisement and see the created entry in the list
    Given I visit the HomePage
    When I add the new ad
    Then the new ad is added

  Scenario: User is able to edit an advertisement and see the updated entry in the list
    Given I visit the HomePage
    When I add the new ad
    Then the new ad is added
    When I click an item to edit

  Scenario: User should provide a price with a proper format
    Given I visit the HomePage
    When I add the new ad using alphabetical for currency format
    Then I should see the error message regarding the invalid price

  Scenario: User should see error when providing a blank ad name
    Given I visit the HomePage
    When I add the new ad with blank ad name
    Then I should see the error message regarding the blank ad name

  Scenario: User should see error when providing a space ad name
    Given I visit the HomePage
    When I add the new ad with space ad name
    Then I should see the error message regarding the invalid ad name

  Scenario: User should see error when providing ad name with more than 50 characters
    Given I visit the HomePage
    When I add the new ad with more than 50 character ad name
    Then I should see the error message regarding the ad name reached its length

  Scenario: User should see the save button active until the form is valid
    Given I visit the HomePage
    When I click the add new add button
    Then I should see the save button is disabled
    When I have new add info
    And I input valid ad name
    Then I should see the save button is disabled
    When I input valid price
    Then I should see the save button is enabled

  Scenario: User is able to sort ad name by descending
    Given I visit the HomePage
    When I click the sort icon on the ad name
    Then I should see the list is descending

  Scenario: User is able to sort ad name by ascending
    Given I visit the HomePage
    Then I should see the list is ascending

  Scenario: User should receive proper information over WebSockets and see the live changes on list
    Given I visit the HomePage
    When I open new ad form in another tab
    And I have new add info
    And I input valid ad name
    And I input valid price
    And I save the new ad info
    And I move to previous tab
    Then I should see the list changed toast



