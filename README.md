# Ejecución con Docker

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
