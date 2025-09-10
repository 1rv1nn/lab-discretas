# Instrucciones para tener GHCi en WSL

## Requisitos Previos
Asegúrate de tener instalado Windows Subsystem for Linux (WSL) en tu máquina. Puedes habilitarlo desde las características de Windows.
o simplemente abrir en windows powerShell y teclear el comando:

   `wsl --install`

Se te instalará una distribución por defecto (Ubuntu) para acceder a ella:

   `wsl -d Ubunt`

y para salir 

   `exit`

## Instalación de GHCi

1. **Abre tu terminal WSL**:
   - Puedes hacerlo buscando "WSL" en el menú de inicio de Windows.

2. **Actualiza los paquetes**:
   ```bash
   sudo apt update
   sudo apt upgrade
   ```

3. **Instala GHC y Cabal**:
   - Para instalar GHCi, primero necesitas instalar GHC (Glasgow Haskell Compiler) y Cabal (el sistema de construcción de Haskell). Ejecuta el siguiente comando:
   ```bash
   sudo apt install ghc cabal-install
   ```

4. **Verifica la instalación**:
   - Una vez completada la instalación, verifica que GHCi esté instalado correctamente ejecutando:
   ```bash
   ghci --version
   ```

## Uso de GHCi

- Para iniciar GHCi, simplemente escribe `ghci` en la terminal y presiona Enter.
- Puedes cargar archivos Haskell usando el comando `:load nombre_del_archivo.hs`.
- Para salir de GHCi, utiliza el comando `:quit`.


