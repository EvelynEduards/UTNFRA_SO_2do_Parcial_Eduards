#!/bin/bash

# Definir los discos
DISK1="/dev/sdc"    # Disco de 2 GB
DISK2="/dev/sdd"    # Disco de 1 GB

# Preparar los discos (creación de particiones)
echo "Preparando discos"
sudo fdisk $DISK1 <<EOF
n
p


t
8E
w
EOF

sudo fdisk $DISK2 <<EOF
n
p


t
82
w
EOF

# Inicializar los discos como volúmenes físicos (PV)
sudo pvcreate $DISK1 $DISK2

# Crear los grupos de volúmenes (VG)
sudo vgcreate vg_datos $DISK1
sudo vgcreate vg_temp $DISK2

# Crear los volúmenes lógicos (LV)
# Ajuste de tamaños para que sean adecuados para cada uso
sudo lvcreate -L 10G -n lv_docker vg_datos      # 10GB para Docker
sudo lvcreate -L 1.5G -n lv_workareas vg_datos  # 1.5GB para Work Areas
sudo lvcreate -L 512M -n lv_swap vg_temp        # 512MB para Swap

# Formatear los volúmenes lógicos
sudo mkfs.ext4 /dev/vg_datos/lv_docker
sudo mkfs.ext4 /dev/vg_datos/lv_workareas
sudo mkswap /dev/vg_temp/lv_swap

# Crear los directorios de montaje
sudo mkdir -p /var/lib/docker
sudo mkdir -p /work

# Montar los volúmenes lógicos
sudo mount /dev/vg_datos/lv_docker /var/lib/docker
sudo mount /dev/vg_datos/lv_workareas /work
sudo swapon /dev/vg_temp/lv_swap

# Añadir las entradas a /etc/fstab para montajes automáticos
echo "/dev/vg_datos/lv_docker /var/lib/docker ext4 defaults 0 0" | sudo tee -a /etc/fstab
echo "/dev/vg_datos/lv_workareas /work ext4 defaults 0 0" | sudo tee -a /etc/fstab
echo "/dev/vg_temp/lv_swap swap swap defaults 0 0" | sudo tee -a /etc/fstab

# Reiniciar Docker para asegurar que utilice el nuevo espacio
sudo systemctl restart docker
sudo systemctl status docker

