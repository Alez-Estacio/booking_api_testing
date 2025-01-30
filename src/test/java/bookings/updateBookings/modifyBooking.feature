Feature: Test for modify booking by id

I as user require put booking by id for validate integrity of the response

  Background:
    * url 'https://restful-booker.herokuapp.com'
    * def response_booking = call read('classpath:bookings/createBookings/createBooking.feature@CreateBooking')
    * def auth_token = call read('classpath:bookings/authentication/createToken.feature')

  @HappyPath
  Scenario: Request type get to api for validate booking by ID
    Given header Accept = 'application/json'
    And header Cookie = 'token=' + auth_token.response.token
    And def bookingId = response_booking.response.bookingid
    And path 'booking/' + bookingId
    And request read('classpath:bookings/updateBookings/RequestBodyUpdateBooking.json')
    When method PUT
    Then status 200
    And match response.firstname == "Don Mauricio"

  @HappyPath
  Scenario: Update booking with only name change
    Given header Accept = 'application/json'
    And header Cookie = 'token=' + auth_token.response.token
    And def bookingId = response_booking.response.bookingid
    And path 'booking/' + bookingId
    And request read('classpath:bookings/updateBookings/RequestBodyUpdateBookingName.json')
    When method PUT
    Then status 200
    And match response.firstname == "Luisa"
    And match response.lastname == "Ramirez"

  @ScenarioAltern
  Scenario: Attempt to update booking with invalid token
    Given header Accept = 'application/json'
    And header Cookie = 'token=invalidToken123'
    And def bookingId = response_booking.response.bookingid
    And path 'booking/' + bookingId
    And request read('classpath:bookings/updateBookings/RequestBodyUpdateBookingInvalidT.json')
    When method PUT
    Then status 403

  @ScenarioAltern
  Scenario: Attempt to update non-existent booking
    Given header Accept = 'application/json'
    And header Cookie = 'token=' + auth_token.response.token
    And path 'booking/999999'
    And request read('classpath:bookings/updateBookings/RequestBodyUpdateBookingNoExis.json')
    When method PUT
    Then status 405
  #Verificar que el metodo PUT no está permitido para reservas inexistentes

  @unhappyPath
  Scenario Outline: Verify update with invalid booking ID returns expected status
    Given header Accept = 'application/json'
    And header Cookie = 'token=' + auth_token.response.token
    And path 'booking/' + <invalidId>
    And request read('classpath:bookings/updateBookings/RequestBodyUpdateBooking.json')
    When method PUT
    Then status <expectedStatus>
    Examples:
      | descriptionTitle    | invalidId | expectedStatus |
      | special characters  | "%$&?¡"   | 405            |
      | negative numbers    | -1562     | 405            |
      | high decimal value  | 123456.78 | 405            |
      | boolean false value | false     | 405            |
