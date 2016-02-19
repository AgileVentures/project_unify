Feature: As a system admin
  In order to be able to perform CRUD actions on users
  I would like to be able to access them through Godmin interface


  Background:
    Given the following users exist
      | user_name |
      | Thomas    |
      | Mazen     |
      | Tarek     |
      | Ivan      |
    Given the admin account is set up
    Given I am logged in as admin

  Scenario: View Users index
    Given I click on "User"
    Then I should see "Thomas"
    And I should see "Mazen"
    And I should see "Tarek"
    And I should see "Ivan"

  Scenario: Create a user
    Given I click on "User"
    And I click on "Create User"
    And I fill in "User name" with "Tony"
    And I click on "Create User"
    Then show me the page
    Then I should see "User was successfully created"
    And I should see 5 instances of User

