#!/bin/bash

# Archivo de texto con la lista de usuarios
ARCHIVO_USUARIOS="/home/vagrant/repogit/202406/bash_script/Lista_Usuarios.txt"

# Usuario base para obtener la contraseña
USUARIO_BASE="vagrant"

# Validar que el archivo exista
if [ ! -f "$ARCHIVO_USUARIOS" ]; then
  echo "Error: No se encontró el archivo $ARCHIVO_USUARIOS."
  exit 1
fi

# Validar que el usuario base exista
CLAVE_BASE=$(sudo grep "^$USUARIO_BASE:" /etc/shadow | awk -F ':' '{print $2}')
if [ -z "$CLAVE_BASE" ]; then
  echo "Error: No se encontró la clave del usuario $USUARIO_BASE."
  exit 1
fi

# Leer el archivo línea por línea
while IFS=',' read -r USUARIO GRUPO DIRECTORIO; do
  # Ignorar líneas vacías y comentarios
  [[ "$USUARIO" =~ ^#.*$ || -z "$USUARIO" ]] && continue

  # Crear el grupo si no existe
  if ! grep -q "^$GRUPO:" /etc/group; then
    sudo groupadd "$GRUPO"
    echo "Grupo $GRUPO creado."
  fi

  # Crear el usuario si no existe
  if ! id "$USUARIO" &>/dev/null; then
    sudo useradd -m -s /bin/bash -g "$GRUPO" -d "$DIRECTORIO" -p "$CLAVE_BASE" "$USUARIO"
    echo "Usuario $USUARIO creado con grupo $GRUPO y directorio $DIRECTORIO."
  fi
done < "$ARCHIVO_USUARIOS"

echo "Usuarios y grupos creados correctamente."

