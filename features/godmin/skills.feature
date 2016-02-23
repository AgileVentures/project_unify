Feature: As a system administrator
  In order to be able to match users using their common interests
  I would like to allow users to add tags to their profile

  As a user
  In order to make my profile more descriptive
  I would like to tag myself with competence tags

  https://www.pivotaltracker.com/story/show/113903923

  Background:
    Given the following users exist
      | user_name |
      | Thomas    |
    Given the admin account is set up
    Given I am logged in as admin
    Given I click on "Users"

  Scenario: Create a user
    And I click on "Create User"
    And I fill in "User name" with "Anders"
    And I fill in "Skill list" with "java, ruby, html"
    And I click on "Create User"
    Then I should see "User was successfully created"
    Then the updated users skills should be "java, ruby, html"

  Scenario: Update user by adding tags
    Given "Thomas" skills are "rspec, testing"
    And I click on "Edit" for "Thomas"
    And I fill in "Skill list" with "java, ruby, html"
    And I click on "Update User"
    Then I should see "User was successfully updated"
    Then the updated users skills should be "rspec, testing, java, ruby, html"

  @javascript
  Scenario: Update user by removing
    Given "Thomas" skills are "rspec, testing"
    And I click on "Edit" for "Thomas"
    And I delete the content of "Skill list"
    Then show me the page
    And I fill in "Skill list" with "java, ruby, html"
    And I click on "Update User"
    Then I should see "User was successfully updated"
    Then the updated users skills should be "java, ruby, html"

