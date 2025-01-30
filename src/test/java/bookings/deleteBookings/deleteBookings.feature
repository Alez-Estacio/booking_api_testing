Feature: Manage Booking Deletion

  Background:
    * url 'https://restful-booker.herokuapp.com'

  @HappyPath
  Scenario: Delete a booking with basic auth
    Given path 'booking/1'
    And header Content-Type = 'application/json'
    And header Authorization = 'Basic YWRtaW46cGFzc3dvcmQxMjM='
    When method DELETE
    * def responseStatus = responseStatus
    * assert responseStatus == 201 || responseStatus == 405
  #Cambia a "201" si tado de la respuestala eliminación de la reserva es exitosa, o "405"

  @HappyPath
  Scenario: Delete booking and verify HTTP status
    Given path 'booking/3'
    And header Content-Type = 'application/json'
    And header Authorization = 'Basic YWRtaW46cGFzc3dvcmQxMjM='
    When method DELETE
    * def responseStatus = responseStatus
    * assert responseStatus == 201 || responseStatus == 405
  #verifica si la eliminación de la reserva es exitosa (201) o si el metodo DELETE no está permitido (405)

  @ScenarioAltern
  Scenario: Attempt to delete a booking with invalid token
    Given path 'booking', '1'
    And header Content-Type = 'application/json'
    And header Cookie = 'token=invalidToken123'
    When method DELETE
    Then status 403

  @ScenarioAltern
  Scenario: Attempt to delete a booking with malformed token
    Given path 'booking', '1'
    And header Content-Type = 'application/json'
    And header Cookie = 'token=malformed-token'
    When method DELETE
    Then status 403

  @unhappyPath
  Scenario Outline: Verify deletion with invalid authorization returns expected status
    Given path 'booking/' + <bookingId>
    And header Content-Type = 'application/json'
    And header Authorization = <invalidAuth>
    When method DELETE
    Then status <expectedStatus>
    Examples:
      | descriptionTitle             | bookingId | invalidAuth                  | expectedStatus |
      | invalid token                | 1         | 'Basic invalidToken123'      | 403            |
      | malformed token              | 1         | 'Basic malformed-token'      | 403            |
      | missing authorization header | 1         | ''                           | 403            |
      | incorrect credentials        | 1         | 'Basic YWRtaW46aW5jb3JyZWN0' | 403            |

