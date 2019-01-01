Feature: Add some products to my cart

  Scenario: Log in to Getir and add some products
    When Log in page is opened
    Given I write my email as "hello@getir.com"
    And I write my password as "hello"
    And I click sign in button
    Then Categories page is opened
    When I go to "Kişisel Bakım" page
    Then Kisisel Bakim page is opened
    Then I add "Krem" to my cart
    And I go to previous page
    Then Categories page is opened
    When I go to "Ev Bakımı" page
    Then Ev Bakımı page is opened
    And I add "Camsil" to my cart
    When I go to my cart
    Then Shopping cart page is opened
    And I should see products in the cart
      | product_1 | product_2 |
      | Krem      | Camsil    |
    And I delete all of products in my cart


