#!/bin/bash

# Navegar a la carpeta de tasks del rol
cd repogit/202406/ansible/roles/2do_parcial/tasks

# Listar los archivos en el directorio actual
ls -l

# Abrir main.yml para editar las tareas
vim main.yml

# Ingresar las tareas de creación de directorios
echo "Escribí en main.yml las siguientes tareas:"
cat <<EOL
# Tareas para crear estructura de directorios
- name: Crear directorio base /tmp/2do_parcial
  file:
    path: /tmp/2do_parcial
    state: directory
    mode: '0755'

- name: Crear subdirectorio alumno
  file:
    path: /tmp/2do_parcial/alumno
    state: directory
    mode: '0755'

- name: Crear subdirectorio equipo
  file:
    path: /tmp/2do_parcial/equipo
    state: directory
    mode: '0755'
EOL

# Crear archivo de plantilla datos_alumno.txt.j2
cd ../templates
vim datos_alumno.txt.j2

echo "Escribí lo siguiente en datos_alumno.txt.j2:"
cat <<EOL
Nombre: Evelyn Apellido: Eduards
Division: 311
EOL

# Crear archivo de plantilla datos_equipo.txt.j2
vim datos_equipo.txt.j2

echo "Escribí lo siguiente en datos_equipo.txt.j2:"
cat <<EOL
IP: 192.168.56.3
Distribución: {{ ansible_distribution }}
Cantidad de cores: {{ ansible_processor_cores }}
EOL

# Volver a la carpeta de tareas
cd ../tasks

# Abrir nuevamente main.yml para agregar más tareas
vim main.yml

echo "Agregué las siguientes tareas al main.yml:"
cat <<EOL
# Crear el archivo datos_alumno.txt
- name: Crear datos_alumno.txt
  template:
    src: datos_alumno.txt.j2
    dest: /tmp/2do_parcial/alumno/datos_alumno.txt

# Crear el archivo datos_equipo.txt
- name: Crear datos_equipo.txt
  template:
    src: datos_equipo.txt.j2
    dest: /tmp/2do_parcial/equipo/datos_equipo.txt

# Crear el grupo "2PSupervisores"
- name: Crear grupo 2PSupervisores
  become: yes
  group:
    name: 2PSupervisores
    state: present

# Configurar sudoers para permitir que los usuarios del grupo "2PSupervisores" no necesiten contraseña
- name: Configurar sudoers para el grupo 2PSupervisores
  lineinfile:
    path: /etc/sudoers
    regexp: '^%2PSupervisores'
    line: '%2PSupervisores ALL=(ALL) NOPASSWD: ALL'
    validate: '/usr/sbin/visudo -cf %s'
EOL

# Navegar al directorio base del proyecto y crear el playbook
cd ~/repogit/202406/ansible
vim playbook.yml

echo "Escribí lo siguiente en playbook.yml:"
cat <<EOL
- hosts: all
  become: yes  # Agrega esto para que todas las tareas se ejecuten con privilegios de superusuario
  tasks:
    - name: "Ejecutar 2do Parcial"
      include_role:
        name: 2do_parcial
EOL

# Ejecutar el playbook (opcional, solo si se requiere)
echo "Para ejecutar el playbook, usa el siguiente comando:"
echo "ansible-playbook -i localhost, playbook.yml"

# Fin del script
echo "Script completado. Este archivo refleja todos los pasos realizados."

