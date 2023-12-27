#!/bin/bash

PROPORTION=0.1

file=$1

# Extraer el nombre del archivo
file_name=$(basename "$file")

# Extraer el directorio
directory=$(dirname "$file")

# Calcula el número de líneas del archivo
TOTAL_LINES=$(wc -l < "$file")

# Calcula el número de líneas a conservar
LINES_TO_KEEP=$(echo "$TOTAL_LINES  $PROPORTION"  | awk '{print int($1*$2+0.5)}')

# Corta el archivo y guarda la parte superior
head -n $LINES_TO_KEEP "$file" > "$directory/temp_$file_name"

# Renombra el archivo temporal al original
mv "$directory/temp_$file_name" "$file"
