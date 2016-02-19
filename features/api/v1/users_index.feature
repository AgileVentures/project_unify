Feature:

  Background:
    Given the following users exist
      | user_name | created_at               |
      | Thomas    | 2016-02-01T00:00:00.922Z |
      | Mazen     | 2016-02-01T00:00:00.922Z |
      | Tarek     | 2016-02-01T00:00:00.922Z |
      | Ivan      | 2016-02-01T00:00:00.922Z |


  Scenario: Returning a JSON response
    Given: The API is running
    And the Accept Type is application/json
    And the client requests GET /api/v1/users
    Then a "200" status code is returned
    And the index JSON response should show info about:
      | user   |
      | Thomas |
      | Mazen  |
      | Tarek  |
      | Ivan   |
