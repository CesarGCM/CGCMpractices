#!/bin/bash

function checker {
	7z l $1 > /dev/null 2>&1
	if [ "$(echo $?)" == "0" ]; then
		echo "Descomprimiendo..."
		sleep 1
	else
		echo "Archivo inexistente o incapaz de descomprimir"
		exit 1
	fi
}
echo "Ingrese el nombre del archivo"
read decompressed_name
checker $decompressed_name
while true; do
	7z l $decompressed_name > /dev/null 2>&1
	if [ "$(echo $?)" == "0" ]; then
		decompressed_next_name=$(7z l $decompressed_name | grep "Name" -A 2 | tail -n 1 | awk 'NF{print $NF}')
		7z x $decompressed_name > /dev/null 2>&1 && decompressed_name=$decompressed_next_name
	else
		exit 1
	fi
done
