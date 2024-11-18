#!/bin/bash

# Navegar dentro de la carpeta docker
cd ~/repogit/RTA_Examen_20241116/docker/

# Verificar los archivos dentro de la carpeta docker
ls -l

# Abrir vim para crear el archivo index.html
vim index.html

# En vim, agregar el siguiente contenido (lo hago manualmente en vim):
# <div>
# <h1> Sistemas Operativos - UTNFRA </h1></br>
# <h2> 2do Parcial - Noviembre 2024 </h2> </br>
# <h3> Evelyn Eduards</h3>
# <h3> División: 311 </h3>
# </div>

# Abrir vim para crear el Dockerfile
vim Dockerfile

# En vim, agregar el siguiente contenido (lo hago manualmente en vim):
# # Usa la imagen oficial de nginx como base
# FROM nginx:latest
#
# # Copia el archivo index.html en el contenedor, en el directorio de nginx
# COPY index.html /usr/share/nginx/html/index.html
#
# # Expone el puerto 80 (puerto por defecto de nginx)
# EXPOSE 80

# Construir la imagen de Docker
docker build -t evelyneduards/web1:latest .

# Verificar las imágenes de Docker
docker image list

# Hacer push de la imagen al repositorio
docker push evelyneduards/web1:latest

# Crear el archivo run.sh
touch run.sh

# Abrir vim para escribir en run.sh
vim run.sh

# En vim, agrega el siguiente contenido (lo hago manualmente en vim):
# #!/bin/bash
# 
# # Ejecutar el contenedor en el puerto 8080
# docker run -d -p 8080:80 evelyneduards/web1:latest

# Dar permisos de ejecución al archivo run.sh
chmod +x run.sh

# Mostrar la IP de la máquina para acceder desde el navegador
ip a

# Ejecutar el script run.sh
./run.sh

