# Blueprint: Florería Ajolote App

## Visión General

Esta aplicación es para una florería llamada "Florería Ajolote". La aplicación permitirá a los usuarios ver diferentes arreglos florales, horarios y perfiles. El diseño se basará en la estructura de la aplicación "GymPro" proporcionada, pero adaptada a la temática de una florería.

## Diseño y Estilo

*   **Tema:** Moderno, limpio y floral.
*   **Paleta de Colores:** Usaremos tonos inspirados en flores y ajolotes, como lilas, rosas, verdes y neutros.
*   **Tipografía:** Se usarán fuentes de Google Fonts para darle un aspecto profesional y legible.
*   **Iconografía:** Iconos de Material Design relacionados con flores, plantas y perfiles de usuario.
*   **Layout:** El diseño seguirá la estructura de 3 pantallas principales con navegación inferior, como en el diseño de "GymPro".

## Plan de Implementación

1.  **Configurar el Tema Principal:**
    *   En `main.dart`, definir un `ThemeData` global con `ColorScheme.fromSeed` para un esquema de colores cohesivo.
    *   Utilizar `google_fonts` para la tipografía.

2.  **Reestructurar la Navegación:**
    *   Crear un widget principal `HomeScreen` que contenga un `BottomNavigationBar`.
    *   Las tres pantallas (Inicio, Pantalla2, Pantalla3) se mostrarán dentro del cuerpo de `HomeScreen` según la pestaña seleccionada.
    *   Mantener las rutas nombradas en `main.dart` como `/`, `/pantalla2`, y `/pantalla3` para cumplir con los requisitos.

3.  **Actualizar las Pantallas:**
    *   **Inicio.dart (Pantalla de Bienvenida):**
        *   Mostrará el nombre del estudiante y el grupo.
        *   Tendrá una imagen principal y un texto de bienvenida.
    *   **pantalla2.dart (Catálogo de Arreglos):**
        *   Adaptar el diseño de lista de "GymPro" para mostrar arreglos florales en lugar de clases.
        *   Cada elemento de la lista mostrará una imagen del arreglo, nombre, horario de disponibilidad y un botón o icono.
        *   Añadir una fila de iconos circulares en la parte superior para filtrar por tipo de flor.
    *   **pantalla3.dart (Perfil):**
        *   Crear una pantalla de perfil de usuario simple.

4.  **Corregir y Mejorar:**
    *   Asegurar que cada pantalla tenga un `AppBar` con un título y color de fondo diferente, y dos iconos de `actions`.
    *   Utilizar las imágenes desde el repositorio de GitHub proporcionado.
    *   Verificar que todo el código esté bien formateado, sin errores y siga las mejores prácticas de Flutter.
    *   Añadir el paquete `google_fonts` a `pubspec.yaml`.
