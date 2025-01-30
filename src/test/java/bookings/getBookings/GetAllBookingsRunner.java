package bookings.getBookings;

import com.intuit.karate.junit5.Karate;

public class GetAllBookingsRunner {

    @Karate.Test
    Karate testGetAllBookings() {
        return Karate.run("classpath:bookings/getBookings/getAllBookings.feature");
    }
}
