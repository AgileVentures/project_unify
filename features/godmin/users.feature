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

    Scenario: View Users index
      Given I am logged in as admin
      And I click on "Users"
      Then I should see "Thomas"
      And I should see "Mazen"
      And I should see "Tarek"
      And I should see "Ivan"

