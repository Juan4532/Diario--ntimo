# Diario Íntimo - Herramienta de Cifrado y Descifrado

Este proyecto proporciona un script en Bash para cifrar y descifrar directorios utilizando GPG. Es útil para proteger información confidencial, como un diario personal.

## Requisitos

Antes de usar este script, asegúrate de cumplir con los siguientes requisitos:

1. **GNU Privacy Guard (GPG)**: Instala GPG si no lo tienes ya instalado.

   - **Linux**: Ejecuta `sudo apt install gnupg` (Debian/Ubuntu) o el gestor de paquetes de tu distribución.
   - **macOS**: Instala GPG usando Homebrew: `brew install gnupg`.
   - **Windows**: Descarga e instala GPG desde [GPG4Win](https://gpg4win.org/).

2. Un par de claves GPG:

   - Genera un par de claves públicas y privadas ejecutando el siguiente comando:
     ```bash
     gpg --full-generate-key
     ```
   - Sigue las instrucciones para crear las claves. Asegúrate de recordar el identificador (correo electrónico o ID).

## Instalación

1. Clona este repositorio:

   ```bash
   git clone https://github.com/tu-usuario/Diario-intimo.git
   ```

2. Navega al directorio del proyecto:

   ```bash
   cd Diario-intimo
   ```

3. Asegúrate de que el script tiene permisos de ejecución:

   ```bash
   chmod +x diario-intimo.sh
   ```

## Uso

### Menú Principal

Ejecuta el script para acceder al menú principal:

```bash
./diario-intimo.sh
```

### Opciones

1. **Cifrar un directorio**:

   - Selecciona la opción `1`.
   - Introduce el nombre del directorio que deseas cifrar.
   - Proporciona el identificador de la clave pública (correo electrónico o ID).
   - El script comprimirá y cifrará el directorio, eliminando el original.
   - El archivo cifrado se guardará como `nombre-del-directorio.tar.gz.gpg`.

2. **Descifrar un directorio cifrado**:

   - Selecciona la opción `2`.
   - Introduce el nombre del archivo cifrado (`.tar.gz.gpg`).
   - El script descifrará y descomprimirá el contenido, restaurando el directorio original.

3. **Salir**:

   - Selecciona la opción `3` para salir del programa.

## Ejemplo de Uso

### Cifrar un directorio

Supongamos que tienes un directorio llamado `mi_diario` que deseas proteger:

```bash
./diario-intimo.sh
```

- Selecciona `1`.
- Introduce `mi_diario` como el nombre del directorio.
- Proporciona el identificador de la clave pública (por ejemplo, `correo@ejemplo.com`).
- Resultado: `mi_diario` será eliminado y el archivo cifrado `mi_diario.tar.gz.gpg` será creado.

### Descifrar un archivo cifrado

Si tienes el archivo `mi_diario.tar.gz.gpg`:

```bash
./diario-intimo.sh
```

- Selecciona `2`.
- Introduce `mi_diario.tar.gz.gpg` como el nombre del archivo.
- Resultado: El contenido será descifrado y restaurado en el directorio `mi_diario`.

## Notas de Seguridad

- Asegúrate de mantener tu clave privada segura.
- Haz copias de seguridad de tus claves GPG para evitar perder acceso a tus datos cifrados.
- Solo comparte tu clave pública con personas de confianza.


