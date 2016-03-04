#@javascript
#Feature: As a user
#  In order to be able match users
#  I would like to have a matching method in place and be able to see a json response of potential users to connect with
#
#  (This is about the admin interface for demo purposes)
#
#  PT story: https://www.pivotaltracker.com/story/show/112745899
#
#  Background:
#    Given the following users exist
#      | user_name | skills                        | mentor |
#      | Thomas    | programming, cooking, Travels | true   |
#      | Sam       | programming                   | true   |
#      | Mazen     | sailing                       | false  |
#      | Tarek     | Programming, politics         | false  |
#      | Ivan      | programming                   | false  |
#
#
#  Scenario: Returning a JSON response
#    Given: The API is running
#    And the Accept Type is application/json
#    And the client requests GET /api/v1/unify/1
#    Then a "200" status code is returned
#    And the unify JSON response should show info about:
#      | matches |
#      | Tarek   |
#      | Ivan    |
