#!/bin/bash
# Ejecuta el contenedor basado en la imagen 'evelyneduards/web1'
docker run -d -p 8080:80 --name web1-container evelyneduards/web1:latest

