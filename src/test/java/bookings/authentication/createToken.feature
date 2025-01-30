@ignore
Feature: create token for authentication for autorization of modificate

  Background:
    * url 'https://restful-booker.herokuapp.com'

  @CreateToken
  Scenario: Create token successful
    Given path 'auth'
    And request
      """
      {
        "username" : "admin",
        "password" : "password123"
      }
      """
    When method POST
    Then status 200
    And match response == { token: "#string"}