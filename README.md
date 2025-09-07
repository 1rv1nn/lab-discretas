# Notas de Laboratorio con Haskell

En este repositorio encontrás notas de lenguaje de programación Haskell para el curso de estructuras discretas 2026-1.
Cada directorio tiene una fecha, dentro del el existe un ejecutable con respectiva documentación.

## Ejecución con GHCi instalado localmente

Para poder ejecutarlas, entra al directorio de preferencia e ingresa el siguiente comando en tu terminal.

`ghci nota.hs`

No olvides llamar a la función para probarla.

Te invito a que juegues con las funciones, crea una nueva rama nombrandola con la función que quieras y mejorar realiza un `Pull Request`

## Ejecución con Docker

También puedes usar Docker para ejecutar Haskell sin necesidad de instalarlo localmente:

1. Asegúrate de tener [Docker](https://www.docker.com/products/docker-desktop/) y [Docker Compose](https://docs.docker.com/compose/install/) instalados.

2. Construye la imagen de Docker SOLO basta con hacerlo una vez:

   ```powershell
   docker-compose build
   ```

3. Para iniciar GHCi directamente:

   ```powershell
   docker-compose run --rm haskell ghci
   ```

4. Para acceder a un shell bash dentro del contenedor y despúes de eso entrar al director de tu interes para ejecutar el comando de siempre (ghci nota.hs):

   ```
   docker-compose run --rm haskell bash
   ```

    4.1 Para salir de él
    ```powershell
   exit
   ```


5. Para cargar un archivo específico en GHCi:

   ```powershell
   docker-compose run --rm haskell ghci Clase050925/nota.hs
   ```

## Bibliografía

Miran Lipovača. (2011). Learn You a Haskell for Great Good! A Beginner's Guide. Learn You a Haskell for Great Good!.
[https://learnyouahaskell.github.io/](https://learnyouahaskell.github.io/)
