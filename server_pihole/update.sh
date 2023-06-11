#!/bin/bash

# Función para actualizar Rocky Linux
update_system() {
    echo "Iniciando la actualización del sistema operativo..."
    sudo dnf upgrade -y
    echo "Actualización del sistema operativo completada."
    exit 0
}

# Función para actualizar Pi-hole
update_pihole() {
    echo "Iniciando la actualización de Pi-hole..."
    sudo PIHOLE_SKIP_OS_CHECK=true pihole -up
    echo "Actualización de Pi-hole completada."
    exit 0
}

# Menú interactivo
while true
do
    echo "------------------------------------"
    echo "MENU"
    echo "------------------------------------"
    echo "1. Actualizar solo el sistema operativo"
    echo "2. Actualizar solo Pi-hole"
    echo "3. Actualizar todo"
    echo "4. Salir"
    echo "------------------------------------"
    echo "Por favor, elige una opción: "

    read option

    case $option in
        1) update_system;;
        2) update_pihole;;
        3) 
           update_system
           update_pihole
           ;;
        4) echo "Saliendo..."
           exit 0;;
        *) echo "Opción no válida. Por favor, elige una opción del menú.";;
    esac
done
