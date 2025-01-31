# Booking API Testing

## Descripción

Este proyecto contiene pruebas automatizadas para la API de reservas (Booking API). Utiliza Cucumber para definir escenarios de prueba en formato Gherkin y ejecuta las pruebas con JUnit. Las pruebas están diseñadas para validar diferentes funcionalidades de la API, incluyendo la creación, obtención, modificación y eliminación de reservas.

## Estructura del Proyecto

```
booking_api_testing/
├── .gitignore
├── pom.xml
├── README.md
└── src/
    ├── main/
    └── test/
        ├── java/
        │   └── bookings/
        │       ├── createBookings/
        │       │   └── createBooking.feature
        │       ├── getBookings/
        │       │   └── getAllBookings.feature
        │       ├── updateBookings/
        │       │   └── modifyBooking.feature
        │       └── deleteBookings/
        │           └── deleteBookings.feature
        └── resources/
            └── bookings/
                ├── createBookings/
                │   ├── RequestBodyCreateBooking.json
                │   ├── ResponseBodyCreateBooking.json
                │   └── ResponseSchemaCreateBooking.json
                ├── getBookings/
                │   ├── ResponseBodyGetBooking.json
                │   └── ResponseSchemaGetBooking.json
                ├── updateBookings/
                │   ├── RequestBodyUpdateBooking.json
                │   ├── RequestBodyUpdateBookingName.json
                │   ├── RequestBodyUpdateBookingInvalidT.json
                │   └── RequestBodyUpdateBookingNoExis.json
                └── deleteBookings/
```

## Requisitos

- Java 8 o superior
- Maven 3.6.0 o superior

## Instalación

1. Clona el repositorio:
    ```sh
    git clone https://github.com/tu_usuario/booking_api_testing.git
    ```
2. Navega al directorio del proyecto:
    ```sh
    cd booking_api_testing
    ```
3. Instala las dependencias del proyecto:
    ```sh
    mvn clean install
    ```

## Ejecución de Pruebas

Para ejecutar todas las pruebas en paralelo y generar informes de Cucumber:

```sh
mvn test
```

Los informes de Cucumber se generarán en `target/cucumber-reports`.

## Estructura de las Pruebas

### Crear Reservas

- **Archivo:** `createBooking.feature`
- **Descripción:** Contiene escenarios para probar la creación de reservas con diferentes datos de entrada.

### Obtener Reservas

- **Archivo:** `getAllBookings.feature`
- **Descripción:** Contiene escenarios para probar la obtención de todas las reservas y la obtención de reservas por ID.

### Modificar Reservas

- **Archivo:** `modifyBooking.feature`
- **Descripción:** Contiene escenarios para probar la modificación de reservas existentes con diferentes datos de entrada.

### Eliminar Reservas

- **Archivo:** `deleteBookings.feature`
- **Descripción:** Contiene escenarios para probar la eliminación de reservas con diferentes autorizaciones y datos de entrada.
