Feature: Tests for create bookings

  Background:
    * url 'https://restful-booker.herokuapp.com'
    * header Accept = 'application/json'
    * header Content-Type = 'application/json'

  @HappyPath
  @CreateBooking
  Scenario: Create Booking Successful
    Given path 'booking'
    And def requestBodyJson = read('classpath:bookings/createBookings/RequestBodyCreateBooking.json')
    And request requestBodyJson
    When method POST
    Then status 200
    And match response == read('classpath:bookings/createBookings/ResponseBodyCreateBooking.json')
    And match response == read('classpath:bookings/createBookings/ResponseSchemaCreateBooking.json')

  @HappyPath
  Scenario: Create booking with unpaid deposit
    Given path 'booking'
    And request
      """
      {
        "firstname" : "Ana",
        "lastname" : "Martinez",
        "totalprice" : 500,
        "depositpaid" : false,
        "bookingdates" : {
          "checkin" : "2025-04-10",
          "checkout" : "2025-04-20"
        },
        "additionalneeds" : "Parking"
      }
      """
    When method POST
    Then status 200
    And match response.bookingid == "#notnull"


  @ScenarioAltern
  Scenario: Create Booking with BodyRequest incorrect
    Given path 'booking'
    And request
      """
      {
        "firstname": 123,
        "totalprice": "123"
      }
      """
    When method POST
    Then status 500
    And match response == "Internal Server Error"

  @ScenarioAltern
  Scenario: Create Booking with Empty Request
    Given path 'booking'
    And request {}
    When method POST
    Then status 500

  @ScenarioAltern
  Scenario: Create Booking with Invalid Path
    Given path 'bookings'
    And def requestBodyJson = read('classpath:bookings/createBookings/RequestBodyCreateBooking.json')
    And request requestBodyJson
    When method POST
    Then status 404

  @unhappyPath
  Scenario Outline: Verify booking creation with invalid path returns expected status
    Given path 'bookings'
    And request <requestBody>
    When method POST
    Then status <expectedStatus>
    And match response != '#object'
    Examples:
      | descriptionTitle          | requestBody                                                                                                                                                                               | expectedStatus |
      | valid data but wrong path | { "firstname": "John", "lastname": "Doe", "totalprice": 100, "depositpaid": true, "bookingdates": { "checkin": "2025-04-10", "checkout": "2025-04-20" }, "additionalneeds": "Breakfast" } | 404            |
      | empty request body        | {}                                                                                                                                                                                        | 404            |
      | invalid JSON format       | { "firstname": "John", "lastname": "Doe", "totalprice": 100, "depositpaid": null }                                                                                                        | 404            |








