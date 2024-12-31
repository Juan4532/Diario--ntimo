#!/bin/bash

# Función para cifrar un directorio usando GPG
encrypt_directory() {
    echo "Ingrese el nombre del directorio a cifrar:"
    read dir
    echo "Ingrese el identificador de la clave pública para cifrar (ejemplo: correo o ID):"
    read public_key_id

    if [[ -d "$dir" ]]; then
        # Comprimir el directorio
        tar -czf "$dir.tar.gz" "$dir"

        # Cifrar el archivo comprimido con la clave pública
        gpg --encrypt --recipient "$public_key_id" "$dir.tar.gz"

        # Eliminar el archivo comprimido sin cifrar
        rm -f "$dir.tar.gz"

        # Eliminar el directorio original
        rm -rf "$dir"

        echo "Directorio cifrado guardado como $dir.tar.gz.gpg y el directorio original eliminado."
    else
        echo "El directorio no existe."
    fi
}

# Función para descifrar y descomprimir un directorio cifrado usando GPG
decrypt_directory() {
    echo "Ingrese el archivo cifrado del directorio (.tar.gz.gpg):"
    read encrypted_file

    if [[ -f "$encrypted_file" ]]; then
        # Descifrar el archivo comprimido con la clave privada
        gpg --decrypt "$encrypted_file" > "${encrypted_file%.gpg}"

        # Descomprimir el archivo descifrado
        tar -xzf "${encrypted_file%.gpg}"

        # Eliminar el archivo comprimido descifrado
        rm -f "${encrypted_file%.gpg}"

        echo "Directorio descifrado y descomprimido con éxito."
    else
        echo "El archivo cifrado no existe."
    fi
}

# Menú principal
menu() {
    while true; do
        echo ""
        echo "Opciones:"
        echo "1. Cifrar un directorio"
        echo "2. Descifrar y descomprimir un directorio cifrado"
        echo "3. Salir"
        echo -n "Seleccione una opción: "
        read opcion

        case $opcion in
            1)
                encrypt_directory
                ;;
            2)
                decrypt_directory
                ;;
            3)
                echo "Saliendo del programa."
                exit 0
                ;;
            *)
                echo "Opción no válida."
                ;;
        esac
    done
}

menu
