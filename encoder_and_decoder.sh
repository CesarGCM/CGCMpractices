#!/bin/bash

#Codificador
if [ "$(md5sum fcfm.png)" == '4260808329804b5f553cf3e3d5a446c6 fcfm.png' ]; then
	base64 < fcfm.png > fcfm_encoded.txt
	echo "Se ha realizado la codificacion de: fcfm.png"
else
	echo "Archivo dañado, no se ha realizado la codificacion"
fi

if [ "$(md5sum msg.txt)" == '40744679dff4bf36705c00f9cb815579  msg.txt' ]; then
	base64 < msg.txt > msg_encoded.txt
	echo "Se ha realizado la codificacion de: msg.txt"
else
	echo "Archivo dañado, no se ha realizado la codificacion"
fi

if [ "$(md5sum mystery_img1.txt)" == '5db9862819edb16f9ac0f3b1c406e79d  mystery_img1.txt' ]; then
	base64 -d < mystery_img1.txt > mystery_img1_decoded.png
	echo "Se ha realizado la codificacion de: mystery_img1.png"
else
	echo "Archivo dañado, no se ha realizado la decodificacion"
fi

if [ "$(md5sum mystery_img2.txt)" == 'b091a841da98ca516635f4dfea1dbaf5  mystery_img2.txt' ]; then
	base64 -d < mystery_img2.txt > mystery_img2_decoded.png
	echo "Se ha realizado la codificacion de: mystery_img2.txt"
else
	echo "Archivo dañado, no se ha realizado la decodificacion"
fi
