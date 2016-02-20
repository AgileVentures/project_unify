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
    Given I click on "Users"

  Scenario: View Users index
    Then I should see "Thomas"
    And I should see "Mazen"
    And I should see "Tarek"
    And I should see "Ivan"

  Scenario: View user
    And I click on "Show" for "Mazen"
    Then I should see "Mazen"
    And I should see "Created at"

  Scenario: Create a user
    And I click on "Create User"
    And I fill in "User name" with "Tony"
    And I click on "Create User"
    Then I should see "User was successfully created"
    And I should see 5 instances of User

  Scenario: Update user
    And I click on "Edit" for "Thomas"
    And I fill in "User name" with "Thomas Ochman"
    And I click on "Update User"
    Then I should see "User was successfully updated"
    And the updated users username is "Thomas Ochman"

  Scenario: Delete user
    And I click on "Destroy" for "Ivan"
    Then I should see "User was successfully destroyed"
    And I should see 3 instances of User





