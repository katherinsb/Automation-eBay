Feature: Search shoes

  Scenario: Search Articles
    Given User goes to the Ebay page
     When User search 'Shoes'
      And User select brand 'PUMA'
      And User select size '10'
     Then Print the number of results
      And Order by price ascendant
      And Assert the order taking the first 5 results
      And Order and print the products by name in ascendant mode
      And Order and print the products by price in descendant mode