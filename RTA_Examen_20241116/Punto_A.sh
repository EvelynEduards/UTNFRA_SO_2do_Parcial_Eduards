#!/bin/bash
TIMESTAMP=$(date +%Y%m%d)
PUNTO="A"

# --- 
clear
echo "Se espera ver: "
echo "Discos de 1G y 2G"
echo "vg_datos -> lv_docker=5MB"
echo "vg_datos -> lv_workareas=1.5G"
echo "vg_temp  -> lv_swap=512MB"
echo 

# --- Particionar los discos
echo "Particionando los discos sdc y sdd..."

# Particionar /dev/sdc
sudo fdisk /dev/sdc <<EOF
n
p
1


w
EOF

# Particionar /dev/sdd
sudo fdisk /dev/sdd <<EOF
n
p
1


w
EOF

echo "Discos particionados: sdc1 y sdd1"
echo

# --- Crear Volúmenes Físicos (PVs)
echo "Creando volúmenes físicos (PVs)..."
sudo pvcreate /dev/sdc1 /dev/sdd1
echo "Volúmenes físicos creados"
echo

# --- Crear el Grupo de Volúmenes vg_datos
echo "Creando el grupo de volúmenes 'vg_datos'..."
sudo vgcreate vg_datos /dev/sdc1 /dev/sdd1
echo "Grupo de volúmenes 'vg_datos' creado"
echo

# --- Crear el Grupo de Volúmenes vg_temp
echo "Creando el grupo de volúmenes 'vg_temp'..."
sudo vgcreate vg_temp /dev/sdd1
echo "Grupo de volúmenes 'vg_temp' creado"
echo

# --- Crear Volúmenes Lógicos (LV)
echo "Creando los volúmenes lógicos (LV)..."
sudo lvcreate -L 5M -n lv_docker vg_datos
sudo lvcreate -L 1.5G -n lv_workareas vg_datos
sudo lvcreate -L 512M -n lv_swap vg_temp
echo "Volúmenes lógicos creados: lv_docker, lv_workareas, lv_swap"
echo

# --- Formatear Volúmenes Lógicos
echo "Formateando los volúmenes lógicos..."
sudo mkfs.ext4 /dev/vg_datos/lv_docker
sudo mkfs.ext4 /dev/vg_datos/lv_workareas
sudo mkswap /dev/vg_temp/lv_swap
echo "Volúmenes lógicos formateados"
echo

# --- Montar los Volúmenes
echo "Montando los volúmenes..."
sudo mount /dev/vg_datos/lv_docker /var/lib/docker
sudo mount /dev/vg_datos/lv_workareas /work
sudo swapon /dev/vg_temp/lv_swap
echo "Volúmenes montados: lv_docker, lv_workareas, y swap activado"
echo

# --- Verificación
echo "Verificando el estado..."
echo "lsblk -f"
lsblk -f
echo

echo "pvs - vgs - lvs"
sudo pvs
sudo vgs
sudo lvs
echo

# --- SWAP
echo "Estado de la swap:"
free -h
swapon -s

# --- Montaje de los volúmenes
echo "df -h"
df -h
echo

# --- Comandos usados:
echo
echo "Comandos usados:"
echo "sudo fdisk /dev/sdc"
echo "sudo fdisk /dev/sdd"
echo "sudo pvcreate /dev/sdc1 /dev/sdd1"
echo "sudo vgcreate vg_datos /dev/sdc1 /dev/sdd1"
echo "sudo vgcreate vg_temp /dev/sdd1"
echo "sudo lvcreate -L 5M -n lv_docker vg_datos"
echo "sudo lvcreate -L 1.5G -n lv_workareas vg_datos"
echo "sudo lvcreate -L 512M -n lv_swap vg_temp"
echo "sudo mkfs.ext4 /dev/vg_datos/lv_docker"
echo "sudo mkfs.ext4 /dev/vg_datos/lv_workareas"
echo "sudo mkswap /dev/vg_temp/lv_swap"
echo "sudo mount /dev/vg_datos/lv_docker /var/lib/docker"
echo "sudo mount /dev/vg_datos/lv_workareas /work"
echo "sudo swapon /dev/vg_temp/lv_swap"
echo "cat $HOME/RTA_Examen_${TIMESTAMP}/Punto_${PUNTO}.sh"
echo
cat $HOME/RTA_Examen_${TIMESTAMP}/Punto_${PUNTO}.sh
echo "-------------------------------------------------------------"
echo

