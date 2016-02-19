Feature:

  Background:
    Given the following users exist
      | user_name |
      | Thomas    |
      | Mazen     |
      | Tarek     |
      | Ivan      |


  Scenario: Returning a JSON response
    Given: The API is running
    And the Accept Type is application/json
    And the client requests GET /api/v1/users
    Then a "200" status code is returned
    And the response should be JSON:
      """
        {"users":[{"id":1,"user_name":"Thomas Ochman","created_at":""}]}
      """