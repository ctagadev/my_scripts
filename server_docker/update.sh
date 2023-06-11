#!/bin/bash

# Función para actualizar Rocky Linux
update_system() {
    echo "Iniciando la actualización del sistema operativo..."
    sudo dnf upgrade -y
    echo "Actualización del sistema operativo completada."
    exit 0
}

# Función para actualizar Portainer
update_portainer() {
    echo "Iniciando la actualización de Portainer..."
    sudo docker stop portainer
    sudo docker rm portainer
    sudo docker pull portainer/portainer-ce:latest
    sudo docker run -d -p 9443:9443 --name=portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce:latest
    echo "Actualización de Portainer completada."
    exit 0
}

# Menú interactivo
while true
do
    echo "------------------------------------"
    echo "MENU"
    echo "------------------------------------"
    echo "1. Actualizar solo el sistema operativo"
    echo "2. Actualizar solo Portainer"
    echo "3. Actualizar todo"
    echo "4. Salir"
    echo "------------------------------------"
    echo "Por favor, elige una opción: "

    read option

    case $option in
        1) update_system;;
        2) update_portainer;;
        3) 
           update_system
           update_portainer
           ;;
        4) echo "Saliendo..."
           exit 0;;
        *) echo "Opción no válida. Por favor, elige una opción del menú.";;
    esac
done
