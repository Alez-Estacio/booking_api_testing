# API Testing Framework - Booking API

## Descripción
Framework de automatización de pruebas para la API de Booking utilizando Karate DSL, Cucumber y Java. Este proyecto implementa pruebas end-to-end para validar las operaciones CRUD (Create, Read, Update, Delete) de la API de reservas.

## Tecnologías Utilizadas
- Java 8+
- Maven
- Karate DSL
- Cucumber
- JUnit
- Git

## Estructura del Proyecto
```
booking_api_testing/
├── src/
│   └── test/
│       ├── java/
│       │   └── bookings/
│       │       ├── authentication/    # Pruebas de autenticación
│       │       ├── createBookings/    # Pruebas de creación
│       │       ├── getBookings/       # Pruebas de consulta
│       │       ├── updateBookings/    # Pruebas de actualización
│       │       └── deleteBookings/    # Pruebas de eliminación
│       └── resources/
│           └── bookings/             # Archivos JSON de request/response
```

## Características Principales
- Ejecución paralela de pruebas
- Generación de reportes Cucumber
- Manejo de diferentes escenarios (Happy Path, Alternate, Unhappy Path)
- Validación de esquemas JSON
- Gestión de autenticación
- Pruebas de integración end-to-end

## Configuración del Proyecto

### Prerrequisitos
- JDK 8 o superior
- Maven 3.6.0 o superior
- Git

### Instalación
```bash
# Clonar el repositorio
git clone <url-repositorio>

# Navegar al directorio
cd booking_api_testing

# Instalar dependencias
mvn clean install
```

## Ejecución de Pruebas

### Ejecutar todas las pruebas
```bash
mvn test
```

### Ejecutar un feature específico
```bash
mvn test -Dtest=RunnerTest -Dkarate.options="classpath:bookings/createBookings/createBooking.feature"
```

## Tipos de Pruebas Implementadas

### 1. Creación de Reservas
- Creación exitosa de reservas
- Validación de campos requeridos
- Manejo de datos inválidos
- Validación de respuestas

### 2. Consulta de Reservas
- Obtención de todas las reservas
- Búsqueda por ID
- Manejo de IDs inválidos
- Validación de headers

### 3. Actualización de Reservas
- Actualización completa de reservas
- Actualización parcial
- Manejo de autenticación
- Validación de datos actualizados

### 4. Eliminación de Reservas
- Eliminación exitosa
- Validación de autenticación
- Manejo de IDs inexistentes
- Validación de respuestas

## Reportes
Los reportes se generan automáticamente después de la ejecución de las pruebas:
```
target/cucumber-reports/overview-features.html
```

## Convenciones de Código
- Nombres de features descriptivos
- Uso de tags para categorización
- Documentación clara en escenarios
- Reutilización de código
- Manejo de datos externos en JSON

## Contribución
1. Fork del repositorio
2. Crear rama feature (`git checkout -b feature/NuevaCaracteristica`)
3. Commit cambios (`git commit -am 'Añadir nueva característica'`)
4. Push a la rama (`git push origin feature/NuevaCaracteristica`)
5. Crear Pull Request

## Mantenimiento
- Actualización regular de dependencias
- Revisión periódica de pruebas
- Optimización de rendimiento
- Documentación actualizada
