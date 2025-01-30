Feature: Tests for all get bookings

  Background:
    * url 'https://restful-booker.herokuapp.com'
    * def createBooking = call read('classpath:bookings/createBookings/createBooking.feature@CreateBooking')

  @HappyPath
  Scenario: Get all bookings successful
    Given path 'booking'
    When method GET
    Then status 200
    And print response
    And match response[0].bookingid == '#number'
    And match response[0].bookingid == '#notnull'

  @HappyPath
  Scenario: Get Booking by Id Sucessfull
    Given def createBooking = call read('classpath:bookings/createBookings/createBooking.feature@CreateBooking')
    And def bookingid = createBooking.response.bookingid
    And path 'booking/' + bookingid
    And header Accept = 'application/json'
    When method GET
    Then status 200
    And match response == read("classpath:bookings/getBookings/ResponseBodyGetBooking.json")
    And match response == read("classpath:bookings/getBookings/ResponseSchemaGetBooking.json")

  @ScenarioAltern
  Scenario: Get reservations with errors
    Given path 'bookingXYZ'
    When method GET
    Then status 404

  @ScenarioAltern
  Scenario: Error accessing wrong endpoint
    Given path 'bookings'
    When method GET
    Then status 404

  @ScenarioAltern
  Scenario: Get booking with non-existing ID
    Given path 'booking/99999'
    When method GET
    Then status 404

  @ScenarioAltern
  Scenario: Get booking with ID as a string
    Given path 'booking/stringID'
    When method GET
    Then status 404

  @ScenarioAltern
  Scenario: Get booking without the required header
    Given path 'booking/1'
    When method GET
    * def responseStatus = responseStatus
    * assert responseStatus == 404 || responseStatus == 418
  #El estado cambia de 404 y 418

  @unhappyPath
  Scenario Outline: Verify invalid booking ID returns expected status
    Given path "booking/" + <invalidId>
    When method GET
    Then status <expectedStatus>
    And match response != '#object'
    Examples:
      | descriptionTitle    | invalidId | expectedStatus | typeOfStatus  |
      | special characters  | "%$&?¡"   | 404            | "Bad Request" |
      | negative numbers    | -1562     | 404            | "Bad Request" |
      | high decimal value  | 123456.78 | 404            | "Not Found"   |
      | boolean false value | false     | 404            | "Not Found"   |




























