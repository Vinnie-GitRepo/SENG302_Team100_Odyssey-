Feature: Hint API Endpoint

  Scenario: Successfully creating a hint as the owner of the objective
    Given the application is running
    And I am logged in
    And I have some starting points
    And an objective exists with id 29
    And I own the objective with id 29
    When I attempt to create a hint with the following values for the objective with id 29
      | Message |
      | WEEEEST |
    Then the status code received is 201
    And I have gained points


  Scenario: Successfully creating a hint as a regular user that has solved the objective
    Given the application is running
    And I am logged in
    And I have some starting points
    And an objective exists with id 30
    And I do not own the objective with id 30
    And I have solved the objective with id 30
    When I attempt to create a hint with the following values for the objective with id 30
      | Message |
      | WEEEEST |
    Then the status code received is 201
    And I have gained points

    #  TODO: Vinnie and Matilda, rework the test database insertions so these can pass without affecting older tests
#  Scenario: Successfully creating a hint as a regular user that has solved the objective in a completed quest
#    Given the application is running
#    And I am logged in
#    And an objective exists with id 30
#    And I do not own the objective with id 30
#    And I have solved the objective with id 30
#    When I attempt to create a hint with the following values for the objective with id 30
#      | Message |
#      | WEEEEST |
#    Then the status code received is 201
#
#
#  Scenario: Successfully creating a hint as a regular user that has solved but not checked in the objective in a current quest
#    Given the application is running
#    And I am logged in
#    And an objective exists with id 3
#    And I do not own the objective with id 3
#    And I have solved the objective with id 3
#    When I attempt to create a hint with the following values for the objective with id 3
#      | Message |
#      | WEEEEST |
#    Then the status code received is 201
#
#
#  Scenario: Successfully creating a hint as a regular user that has solved and checked in the objective in a current quest
#    Given the application is running
#    And I am logged in
#    And an objective exists with id 1
#    And I do not own the objective with id 1
#    And I have solved the objective with id 1
#    When I attempt to create a hint with the following values for the objective with id 1
#      | Message |
#      | WEEEEST |
#    Then the status code received is 201


  Scenario: Unsuccessfully creating a hint as a regular user for an unsolved objective that I do not own
    Given the application is running
    And I am logged in
    And an objective exists with id 18
    And I do not own the objective with id 18
    And I have not solved the objective with id 18
    When I attempt to create a hint with the following values for the objective with id 18
      | Message |
      | WEEEEST |
    Then the status code received is 403
    And the following ApiErrors are returned
      | You are not authorized to access this resource. |


  Scenario: Successfully creating a hint as an admin for an unsolved objective that I do not own
    Given the application is running
    And I am logged in as an admin user
    And I have some starting points
    And an objective exists with id 29
    And I do not own the objective with id 29
    And I have not solved the objective with id 29
    When I attempt to create a hint with the following values for the objective with id 29
      | Message |
      | WEEEEST |
    Then the status code received is 201
    And I have gained points


  Scenario: Unsuccessfully creating a hint when I am not logged in
    Given the application is running
    And I am not logged in
    And a user exists with id 3
    And an objective exists with id 29
    When I attempt to create a hint for user 3 with the following values for the objective with id 29
      | Message |
      | WEEEEST |
    Then the status code received is 401
    And the following ApiErrors are returned
      | You are not logged in. |


  Scenario: Unsuccessfully creating a hint for an objective that does not exist
    Given the application is running
    And I am logged in
    And an objective does not exist with id 40
    When I attempt to create a hint with the following values for the objective with id 40
      | Message |
      | WEEEEST |
    Then the status code received is 404
    And the following ApiErrors are returned
      | Requested objective not found. |


#  TODO: Vinnie, determine why these cases are failing (most probably database-related)
#  Scenario: Successfully retrieving all hints for an objective I have completed
#    Given the application is running
#    And I am logged in
#    And an objective exists with id 29
#    And I have solved the objective with id 29
#    When I attempt to retrieve all hints for the objective with id 29
#    Then the status code received is 200
#    And the response contains 2 hints
#
#
#  Scenario: Successfully retrieving all hints for an objective I have completed with no hints
#    Given the application is running
#    And I am logged in
#    And an objective exists with id 29
#    And I have solved the objective with id 29
#    When I attempt to retrieve all hints for the objective with id 29
#    Then the status code received is 200
#    And the response contains 0 hints
#
#
#  Scenario: Successfully retrieving all hints for an objective I have not completed as an admin
#    Given the application is running
#    And I am logged in as an admin user
#    And an objective exists with id 29
#    And I have not solved the objective with id 29
#    When I attempt to retrieve all hints for the objective with id 29
#    Then the status code received is 200
#    And the response contains 2 hints


  Scenario: Unsuccessfully retrieving all hints for an objective I have not completed
    Given the application is running
    And I am logged in
    And an objective exists with id 29
    And I have not solved the objective with id 29
    When I attempt to retrieve all hints for the objective with id 29
    Then the status code received is 403
    And the following ApiErrors are returned
      | You are not authorized to access this resource. |


  Scenario: Unsuccessfully retrieving all hints for an objective that does not exist
    Given the application is running
    And I am logged in
    And an objective does not exist with id 40
    When I attempt to retrieve all hints for the objective with id 40
    Then the status code received is 404
    And the following ApiErrors are returned
      | Requested objective not found. |


  Scenario: Unsuccessfully retrieving all hints for an objective when not logged in
    Given the application is running
    And I am not logged in
    And an objective exists with id 29
    When I attempt to retrieve all hints for the objective with id 29
    Then the status code received is 401
    And the following ApiErrors are returned
      | You are not logged in. |



















